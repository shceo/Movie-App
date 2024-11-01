import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movie_app_v1/src/exports.dart';

Future<void> main() async {
  await dotenv.load(fileName: '.env');

  
  //   await dotenv.load(fileName: '.env');
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  
  runApp(const MovieApp());
}
