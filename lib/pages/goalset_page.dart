// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seed_yap/models/home.dart';
import '../main.dart';

class GoalSet extends ChangeNotifier {
  List<Goal> goal = [
    Goal(objective: '물마시기', startDate: DateTime.now()),
  ];
}

class GoalMain extends StatefulWidget {
  const GoalMain({super.key});

  @override
  State<GoalMain> createState() => _GoalMainState();
}

class _GoalMainState extends State<GoalMain> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
