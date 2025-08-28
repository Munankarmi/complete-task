import 'package:flutter/material.dart';
import 'package:hive_ce/hive.dart';

class DailyProvider extends ChangeNotifier {
  final _daily = Hive.box("DAILY_TASKS");
  List dailyTasks = [];

  DailyProvider() {
    loadDailyTasks();
  }

  void loadDailyTasks() {
    dailyTasks = _daily.get("DAILY_TASKS", defaultValue: []) ?? [];
    notifyListeners();
  }

  void addDailyTask(bool checkValue, String task, String descp,
      [DateTime? alarmTime]) {
    dailyTasks.add([
      checkValue,
      task,
      descp,
      alarmTime?.toString(),
    ]);
    saveDailyTask();
    notifyListeners();
  }

  void saveDailyTask() {
    _daily.put("DAILY_TASKS", dailyTasks);
    notifyListeners();
  }

  void deleteDailyTask(int index) {
    dailyTasks.removeAt(index);
    saveDailyTask();
  }
}
