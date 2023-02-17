import 'package:flutter/material.dart';
import '../main.dart';
import '../models/home.dart';

class GoalService extends ChangeNotifier {
  Goal? goal;

  void checkIfGoalExists() {
    final goalStr = pref.getString('goal');
    if (goalStr == null) {
      //목표가 없음
      goal = null;
      return;
    }
    goal = goalFromJson(goalStr);
    notifyListeners();
  }
}
