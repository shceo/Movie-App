/// Универсальное состояние для ViewModel.
class Loadable<T> {
  const Loadable({
    this.data,
    this.isLoading = false,
    this.error,
  });

  final T? data;
  final bool isLoading;
  final String? error;

  const Loadable.loading() : this(isLoading: true);

  Loadable<T> copyWith({
    T? data,
    bool? isLoading,
    String? error,
  }) {
    return Loadable<T>(
      data: data ?? this.data,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}
