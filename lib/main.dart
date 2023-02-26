import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seed_yap/config/colors.dart';
import 'package:seed_yap/pages/block_page.dart';
import 'package:seed_yap/pages/init_page.dart';
import 'package:seed_yap/service/goal_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences pref;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  pref = await SharedPreferences.getInstance();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => GoalService()),
      ],
      child: const MyApp(),
    ),
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
      home: BlockPage(),
    );
  }
}
