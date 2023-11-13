import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'movie_app.dart';

Future<void> main() async {
  // final Connectivity connectivity = Connectivity();
  // runApp(MultiBlocProvider(providers: [
  //   BlocProvider<InternetCubit>(
  //       create: (_) => InternetCubit(connectivity: connectivity))
  // ], child:

  
  await dotenv.load(fileName: '.env');

  
  //   await dotenv.load(fileName: '.env');
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  
  runApp(const MovieApp(/*router*/));
}
