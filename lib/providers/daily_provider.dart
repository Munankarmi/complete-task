import 'package:flutter/material.dart';
import 'package:hive_ce/hive.dart';

class DailyProvider extends ChangeNotifier {
  final _myBox = Hive.box("MY_BOX");
   List dailyTasks = [
    // [false, 'task3', 'this is task 3'],
    // [
    //   true,
    //   'task 4',
    //   'this description needs to be long as we need long one to test'
    // ]
  ];

  DailyProvider(){
    loadDailyTasks();
  }

  void loadDailyTasks(){
    dailyTasks = _myBox.get("DAILY_TASKS", defaultValue: []) ?? [];
    notifyListeners();
  }

  void addDailyTask(bool checkValue, String task, String descp, [DateTime? alarmTime]) {
    dailyTasks.add([checkValue, task, descp, alarmTime?.toString(),]);
    saveDailyTask();
    notifyListeners();
  }

  void saveDailyTask(){
    _myBox.put("DAILY_TASKS", dailyTasks);
    notifyListeners();
  }

  void deleteDailyTask(int index){
    dailyTasks.removeAt(index);
    saveDailyTask();
    
  }
}
