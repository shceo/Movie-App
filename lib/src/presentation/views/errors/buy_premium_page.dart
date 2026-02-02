import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:movie_app_v1/src/presentation/router/app_routes.dart';

class PremiumPage extends StatelessWidget {
  const PremiumPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/images/premB.png'),
            const SizedBox(height: 20),
            const Text(
              'РњС‹ СЂР°Р±РѕС‚Р°РµРј РЅР°Рґ СЌС‚РёРј...',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Axiforma',
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => context.go(AppRoutes.home),
              child: const Text('Р’РµСЂРЅСѓС‚СЊСЃСЏ РЅР°Р·Р°Рґ'),
            ),
          ],
        ),
      ),
    );
  }
}
