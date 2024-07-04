import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:git_users_app/layers/presentation/views/screens/app.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(const App());
}
