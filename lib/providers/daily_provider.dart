import 'package:flutter/material.dart';

class DailyProvider extends ChangeNotifier {
  final List dailyTasks = [
    [false, 'task3', 'this is task 3'],
    [
      true,
      'task 4',
      'this description needs to be long as we need long one to test'
    ]
  ];

  void addDailyTask(bool checkValue, String task, String descp) {
    dailyTasks.add([checkValue, task, descp]);
    notifyListeners();
  }

  void deleteDailyTask(int index){
    dailyTasks.removeAt(index);
    notifyListeners();
  }
}
