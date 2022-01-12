import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'package:task1/view/screens/mainScreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appPathDir = await getApplicationDocumentsDirectory();
  Hive.init(appPathDir.path);
  await Hive.openBox('crud');
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainScreen(),
    );
  }
}
