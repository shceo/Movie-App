import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:movie_app_v1/src/core/constants/app_colors.dart';
import 'package:movie_app_v1/src/presentation/router/app_routes.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: AppColors.notblack,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: AppColors.notblack,
              ),
              child: const Row(
                children: <Widget>[
                  CircleAvatar(
                    radius: 40.0,
                    backgroundImage: AssetImage('assets/images/welcomeLogo.jpg'),
                  ),
                  SizedBox(width: 30.0),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'User',
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      ),
                      Text(
                        'user@example.com',
                        style: TextStyle(color: Colors.white, fontSize: 14.0),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.search_sharp,
                color: AppColors.white,
              ),
              title: Text(
                'РџРѕРёСЃРє',
                style: TextStyle(fontFamily: 'Axiforma', color: AppColors.white),
              ),
              onTap: () => context.go(AppRoutes.search),
            ),
            ListTile(
              leading: Icon(
                Icons.backup,
                color: AppColors.white,
              ),
              title: Text(
                'РР·Р±СЂР°РЅРЅС‹Рµ',
                style: TextStyle(fontFamily: 'Axiforma', color: AppColors.white),
              ),
              onTap: () => context.go(AppRoutes.favorite),
            ),
            ListTile(
              leading: Icon(
                Icons.star_border,
                color: AppColors.white,
              ),
              title: Text(
                'РџСЂРµРјРёСѓРј',
                style: TextStyle(fontFamily: 'Axiforma', color: AppColors.white),
              ),
              onTap: () => context.go(AppRoutes.premium),
            ),
            ListTile(
              leading: const Icon(
                Icons.settings,
                color: Colors.white,
              ),
              title: Text(
                'РќР°СЃС‚СЂРѕР№РєРё',
                style: TextStyle(fontFamily: 'Axiforma', color: AppColors.white),
              ),
              onTap: () => context.go(AppRoutes.settings),
            ),
            ListTile(
              leading: Icon(
                Icons.account_circle,
                color: AppColors.white,
              ),
              title: Text(
                'РџСЂРѕС„РёР»СЊ',
                style: TextStyle(fontFamily: 'Axiforma', color: AppColors.white),
              ),
              onTap: () => context.go(AppRoutes.profile),
            ),
          ],
        ),
      ),
    );
  }
}
