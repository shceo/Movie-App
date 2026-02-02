import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:movie_app_v1/src/core/constants/app_colors.dart';
import 'package:movie_app_v1/src/presentation/router/app_routes.dart';

class WantBuy extends StatelessWidget {
  const WantBuy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.notblack,
      appBar: AppBar(
        backgroundColor: AppColors.notblack,
        leading: IconButton(
          onPressed: () {
            context.go(AppRoutes.home);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: AppColors.white,
          ),
        ),
      ),
      body: Center(
        child: RichText(
          text: const TextSpan(
            style: TextStyle(
                fontFamily: 'Axiforma',
                fontSize: 14,
                color: Colors.white),
            children: <TextSpan>[
              TextSpan(
                  text:
                      'Хотите Получить Доступ к неограниченнемоу количеству '),
              TextSpan(text: 'запросов', style: TextStyle(color: Colors.red)),
              TextSpan(text: '?\n а так же смотреть фильмы без надоедливой '),
              TextSpan(
                  text: ' рекламы?',
                  style: TextStyle(
                      color: Colors.red, fontFamily: 'Axiforma', fontSize: 20)),
              TextSpan(
                  text:
                      '?\nтак еще в хорошем качестве! \n просто нажмите кнопку ниже и оплатите залог',
                  style: TextStyle(fontFamily: 'Axiforma', fontSize: 20)),
              TextSpan(
                text: '\nв размере 999999\$',
                style: TextStyle(
                    color: Colors.red, fontFamily: 'Axiforma', fontSize: 20),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          context.go(AppRoutes.premium);
        },
        label: const Text('Купить'),
        icon: const Icon(Icons.credit_card),
        backgroundColor: Colors.pink,
      ),
    );
  }
}
