// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:seed_yap/pages/goalset_page.dart';
import '../main.dart';
import '../models/home.dart';

class GoalService extends ChangeNotifier {
  Goal? goal;

  void checkIfGoalExists() {
    final goalStr = pref.getString('goal');
    if (goalStr == null) {
      //목표가 없음
      goal = null;
      return; //만약 목표가 없어서 goalset 페이지로 가게 어떻게 해야 할까?
    }
    goal = goalFromJson(goalStr);
    notifyListeners();
  }
}
