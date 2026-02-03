import 'package:flutter/material.dart';
import 'package:movie_app_v1/src/app/movie_app.dart';

Future<void> main() async {
  // await dotenv.load(fileName: '.env');

  
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MovieApp());
}
  