// пока не рабочая часть кода- наверное не добавлю логику сюда
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app_v1/src/ui/theme/app_colors.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isSwitched1 = true;
  bool isSwitched2 = true;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Scaffold(
        backgroundColor: AppColors.notblack,
        appBar: AppBar(
          backgroundColor: AppColors.notblack,
          title: Text(
            'Настройки',
            style: TextStyle(
                color: AppColors.white,
                fontFamily: 'Axiforma',
                fontWeight: FontWeight.w700),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_outlined,
                color: Colors.white),
            onPressed: () => context.go('/'),
          ),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.6,
              width: MediaQuery.of(context).size.width * 0.9,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(24),
              //   boxShadow: [
              //     BoxShadow(
              //       color: Colors.white.withOpacity(0.3),
              //       spreadRadius: 5,
              //       blurRadius: 7,
              //       offset: const Offset(0, 3),
                  ),
              //   ],
              // ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Смена Языка',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 20,
                        fontFamily: 'Axiforma',
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          'Английский Язык',
                          style: TextStyle(
                            color: AppColors.white,
                            fontFamily: 'Axiforma',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: Switch(
                          value: isSwitched1,
                          onChanged: (value) {
                            setState(() {
                              isSwitched1 = value;
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Text(
                            'Русский Язык',
                            style: TextStyle(
                              color: AppColors.white,
                              fontFamily: 'Axiforma',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Смена темы',
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 20,
                      fontFamily: 'Axiforma',
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          'Светлая тема',
                          style: TextStyle(
                            color: AppColors.white,
                            fontFamily: 'Axiforma',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: Switch(
                          value: isSwitched2,
                          onChanged: (value) {
                            setState(() {
                              isSwitched2 = value;
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Text(
                            'Темная тема',
                            style: TextStyle(
                              color: AppColors.white,
                              fontFamily: 'Axiforma',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}






// тоже самое с блоком (пока не стоит это использовать)
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';
// import 'package:movie_app_v1/ui/theme/app_colors.dart';
// import 'package:movie_app_v1/bloc/settings_bloc.dart';

// class SettingsPage extends StatelessWidget {
//   const SettingsPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => SettingsBloc(),
//       child: _SettingsPageView(),
//     );
//   }
// }

// class _SettingsPageView extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final bloc = BlocProvider.of<SettingsBloc>(context);

//     return Material(
//       color: Colors.transparent,
//       child: Scaffold(
//         backgroundColor: AppColors.notblack,
//         appBar: AppBar(
//           backgroundColor: AppColors.notblack,
//           title: Text(
//             'Настройки',
//             style: TextStyle(
//                 color: AppColors.white,
//                 fontFamily: 'Axiforma',
//                 fontWeight: FontWeight.w700),
//           ),
//           centerTitle: true,
//           leading: IconButton(
//             icon: Icon(Icons.arrow_back_ios_new_outlined, color: Colors.white),
//             onPressed: () => context.go('/'),
//           ),
//         ),
//         body: Center(
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 BlocBuilder<SettingsBloc, SettingsState>(
//                   builder: (context, state) {
//                     return SwitchListTile(
//                       title: Text('Сменить язык', style: TextStyle(color: AppColors.white)),
//                       value: state.isSwitched1,
//                       onChanged: (value) {
//                         bloc.add(ChangeLanguageEvent(value));
//                       },
//                     );
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
