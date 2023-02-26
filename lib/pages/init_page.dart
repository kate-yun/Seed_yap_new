import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seed_yap/models/home.dart';
import 'package:seed_yap/service/goal_provider.dart';

class InitPage extends StatefulWidget {
  const InitPage({super.key});

  @override
  State<InitPage> createState() => _InitPageState();
}

class _InitPageState extends State<InitPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    GoalService goalService = context.read<GoalService>(); //goalservice 불러오기
    goalService.checkIfGoalExists(); //  앱 실행시 목표 있는지 여부

    return Consumer<GoalService>(builder: (context, goalService, child) {
      Goal? goal = goalService.goal;
      return Scaffold(
        body: SafeArea(
          child: goal == null ? Text('목표가 없을 떄') : Text("목표가 있을 때"),
        ),
      );
    });
  }
}
