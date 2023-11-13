import 'package:flutter/material.dart';
import 'package:movie_app_v1/ui/routes/app_navigator.dart';

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return

        //  BlocProvider<InternetCubit>(
        //   create:(_) => InternetCubit(connectivity: Connectivity()),
        //   child:

        MaterialApp.router(
      routerConfig: AppNavigator.router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:connectivity/connectivity.dart';
// import 'package:movie_app_v1/ui/pages/error_pages/error_page.dart';
// import 'package:movie_app_v1/ui/routes/app_navigator.dart';

// class MovieApp extends StatefulWidget {
//   const MovieApp({Key? key}) : super(key: key);

//   @override
//   _MovieAppState createState() => _MovieAppState();
// }

// class _MovieAppState extends State<MovieApp> {
//   ConnectivityResult? _connectionStatus;

//   @override
//   void initState() {
//     super.initState();
//     _checkInternetConnectivity();
//   }

//   Future<void> _checkInternetConnectivity() async {
//     _connectionStatus = await (Connectivity().checkConnectivity());
//     Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
//       setState(() {
//         _connectionStatus = result;
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (_connectionStatus == ConnectivityResult.none) {
//       return MaterialApp(
//         home: NotFound404Error(), // Your 404 error page
//       );
//     } else {
//       return MaterialApp.router(
//         routerConfig: AppNavigator.router,
//         debugShowCheckedModeBanner: false,
//         theme: ThemeData(useMaterial3: true),
//       );
//     }
//   }
// }
