import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app_v1/ui/theme/app_colors.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

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
                    backgroundImage:
                        AssetImage('assets/images/welcomeLogo.jpg'),
                  ),
                  SizedBox(width: 30.0),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('User',
                          style:
                              TextStyle(color: Colors.white, fontSize: 20.0)),
                      Text('user@example.com',
                          style:
                              TextStyle(color: Colors.white, fontSize: 14.0)),
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
                'Поиск',
                style:
                    TextStyle(fontFamily: 'Axiforma', color: AppColors.white),
              ),
              onTap: () {
                context.go('/search');
                // Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.backup,
                color: AppColors.white,
              ),
              title: Text(
                'Избранные',
                style:
                    TextStyle(fontFamily: 'Axiforma', color: AppColors.white),
              ),
              onTap: () {
                context.go('/favorite');
              },
            ),
            ListTile(
              leading: Icon(
                Icons.star_border,
                color: AppColors.white,
              ),
              title: Text(
                'Премиум',
                style:
                    TextStyle(fontFamily: 'Axiforma', color: AppColors.white),
              ),
              onTap: () {
                context.go('/premium');
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.settings,
                color: Colors.white,
              ),
              title: Text(
                'Настройки',
                style:
                    TextStyle(fontFamily: 'Axiforma', color: AppColors.white),
              ),
              onTap: () {
                context.go('/settings');
                // Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.account_circle,
                color: AppColors.white,
              ),
              title: Text(
                'Профиль',
                style:
                    TextStyle(fontFamily: 'Axiforma', color: AppColors.white),
              ),
              onTap: () {
                context.go('/profile');
              },
            ),
          ],
        ),
      ),
    );
  }
}
