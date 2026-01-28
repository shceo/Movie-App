// import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movie_app_v1/src/exports.dart';

Future<void> main() async {
  // await dotenv.load(fileName: '.env');

  
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MovieApp());
}
