import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

import 'package:movie_app_v1/src/core/constants/app_colors.dart';
import 'package:movie_app_v1/src/presentation/router/app_routes.dart';

class UserProfile extends HookWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final profilePictureUrl =
        useState<String>('https://via.placeholder.com/150');
    final userName = useState<String>('РљР°Рє РІР°СЃ Р·РѕРІСѓС‚?');
    final email = useState<String>('user@example.com');
    final bio = useState<String>('РќР°РїРёС€РёС‚Рµ РЅРµРјРЅРѕРіРѕ Рѕ СЃРµР±Рµ ');

    return Scaffold(
      backgroundColor: AppColors.notblack,
      appBar: AppBar(
        backgroundColor: AppColors.notblack,
        title: const Text(
          'Profile',
          style: TextStyle(fontFamily: 'Axiforma', color: Colors.white),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => context.go(AppRoutes.home),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            decoration: BoxDecoration(
              color: Colors.grey,
              boxShadow: const [
                BoxShadow(
                  color: Colors.white,
                  blurRadius: 10.0,
                ),
              ],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(profilePictureUrl.value),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      userName.value,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: () => context.go(AppRoutes.premium),
                      child: TweenAnimationBuilder(
                        tween: Tween<double>(begin: 0, end: 1),
                        duration: const Duration(seconds: 3),
                        builder:
                            (BuildContext context, double val, Widget? child) {
                          return Opacity(
                            opacity: val,
                            child: Text(
                              'РџСЂРѕ РІРµСЂСЃРёСЏ',
                              style: TextStyle(
                                fontSize: 16,
                                color: AppColors.white,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'Axiforma',
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  email.value,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const SizedBox(height: 30),
                Text(
                  bio.value,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    letterSpacing: 2.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
