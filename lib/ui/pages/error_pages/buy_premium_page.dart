import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PremiumPage extends StatelessWidget {
  const PremiumPage({Key? key}) : super(key: key);

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
              'Мы работаем над этим...',
              style: TextStyle(fontSize: 20, fontFamily: 'Axiforma', fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context.go('/');
              },
              child: const Text('Вернуться назад'),
            ),
          ],
        ),
      ),
    );
  }
}

