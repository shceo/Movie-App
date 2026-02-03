import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';

enum NetworkStatus { online, offline }

class NoInternetException implements Exception {
  const NoInternetException();

  @override
  String toString() => 'Нет подключения к интернету';
}

/// Глобальный монитор сети на основе connectivity_plus.
class ConnectivityService extends ChangeNotifier {
  ConnectivityService({Connectivity? connectivity})
      : _connectivity = connectivity ?? Connectivity() {
    _init();
    _subscription =
        _connectivity.onConnectivityChanged.listen(_handleChange);
  }

  final Connectivity _connectivity;
  late final StreamSubscription<List<ConnectivityResult>> _subscription;

  NetworkStatus _status = NetworkStatus.online;

  NetworkStatus get status => _status;
  bool get isOnline => _status == NetworkStatus.online;

  Future<void> _init() async {
    final results = await _connectivity.checkConnectivity();
    _updateStatus(results);
  }

  void _handleChange(List<ConnectivityResult> results) {
    _updateStatus(results);
  }

  void _updateStatus(List<ConnectivityResult> results) {
    final online = results.any((result) => result != ConnectivityResult.none);
    final nextStatus = online ? NetworkStatus.online : NetworkStatus.offline;
    if (nextStatus != _status) {
      _status = nextStatus;
      notifyListeners();
    }
  }

  /// Проверяет наличие соединения и бросает исключение, если его нет.
  Future<void> ensureOnline() async {
    final results = await _connectivity.checkConnectivity();
    _updateStatus(results);
    final online = results.any((result) => result != ConnectivityResult.none);
    if (!online) {
      throw const NoInternetException();
    }
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
