import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seed_yap/pages/goalset_page.dart';
import 'package:seed_yap/pages/init_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'models/colors.dart';

late SharedPreferences pref;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  pref = await SharedPreferences.getInstance();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'seedyap',
      theme: ThemeData(
        scaffoldBackgroundColor: Background.bgc,
        fontFamily: 'Dong',
      ),
      home: InitPage(),
    );
  }
}
