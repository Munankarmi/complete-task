import 'package:flutter/material.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

class WeeklyProvider extends ChangeNotifier {
  final _sunday = Hive.box("SUNDAY_TASKS");
  List sundayTasks = [
    [true, 'test 0', 'this test 0 description'],
    [false, 'test1', 'this is test1 descp'],
  ];

  WeeklyProvider() {
    loadSundayTasks();
    loadMondayTasks();
  }
  void loadSundayTasks() {
    sundayTasks = _sunday.get("SUNDAY_TASKS", defaultValue: []) ?? [];
  }

  void addSundayTask(List listName, bool weeklyCheckValue, String weeklyText,
      String weeklyDescp) {
    listName.add([weeklyCheckValue, weeklyText, weeklyDescp]);
    saveSundayTasks();
    notifyListeners();
  }

  void saveSundayTasks() {
    _sunday.put("SUNDAY_TASKS", sundayTasks);
    notifyListeners();
  }

  void deleteSundayTask(List listName, int index) {
    listName.removeAt(index);
    saveSundayTasks();
    notifyListeners();
  }


 //monday List
  final _mondayTasks = Hive.box("MONDAY_TASKS");
  List mondayTasks = [];

  void loadMondayTasks() {
    mondayTasks = _mondayTasks.get("MONDAY_TASKS", defaultValue: []) ?? [];
  }

  void addMondayTask(List listName, bool weeklyCheckValue, String weeklyText,
      String weeklyDescp) {
    listName.add([weeklyCheckValue, weeklyText, weeklyDescp]);
    saveMondayTasks();
    notifyListeners();
  }

  void saveMondayTasks() {
    _mondayTasks.put("MONDAY_TASKS", mondayTasks);
    notifyListeners();
  }

  void deleteMondayTask(List listName, int index) {
    listName.removeAt(index);
    saveMondayTasks();
    notifyListeners();
  }

  // final _tuesdayTasks = Hive.box("TUESDAY_TASKS");
  List tuesdayTasks = [];

  // final _wednesdayTasks = Hive.box("WEDNESDAY_TASKS");
  List wednesdayTasks = [];

  // final _thursdayTasks = Hive.box("THURSDAY_TASKS");
  List thursdayTasks = [];

  // final _fridayTasks = Hive.box("FRIDAY_TASKS");
  List fridayTasks = [];

  // final _saturdayTasks = Hive.box("SATURDAY_TASKS");
  List saturdayTasks = [];
}
