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
    loadTuesdayTasks();
    loadWednesdayTasks();
    loadThursdayTasks();
    loadFridayTasks();
    loadSaturdayTasks();
  }

  void addWeeklyTask(List listName, bool weeklyCheckValue, String weeklyText,
      String weeklyDescp) {
    listName.add([weeklyCheckValue, weeklyText, weeklyDescp]);
    saveSundayTasks();
    saveMondayTasks();
    saveTuesdayTasks();
    saveWednesdayTaskss();
    saveThursdayTasks();
    saveFridayTasks();
    saveSaturdayTasks();
    notifyListeners();
  }

  void loadSundayTasks() {
    sundayTasks = _sunday.get("SUNDAY_TASKS", defaultValue: []) ?? [];
  }

  void saveSundayTasks() {
    _sunday.put("SUNDAY_TASKS", sundayTasks);
    notifyListeners();
  }

  void deleteWeeklyTask(List listName, int index) {
    listName.removeAt(index);
    saveSundayTasks();
    saveMondayTasks();
    saveTuesdayTasks();
    saveWednesdayTaskss();
    saveThursdayTasks();
    saveFridayTasks();
    saveSaturdayTasks();
    notifyListeners();
  }

  //monday List
  final _mondayTasks = Hive.box("MONDAY_TASKS");
  List mondayTasks = [];

  void loadMondayTasks() {
    mondayTasks = _mondayTasks.get("MONDAY_TASKS", defaultValue: []) ?? [];
  }

  void saveMondayTasks() {
    _mondayTasks.put("MONDAY_TASKS", mondayTasks);
    notifyListeners();
  }

// tuesday list
  final _tuesdayTasks = Hive.box("TUESDAY_TASKS");
  List tuesdayTasks = [];

  void loadTuesdayTasks() {
    tuesdayTasks = _tuesdayTasks.get("TUESDAY_TASKS", defaultValue: []) ?? [];
  }

  void saveTuesdayTasks() {
    _tuesdayTasks.put("TUESDAY_TASKS", tuesdayTasks);
    notifyListeners();
  }

// wednesday list
  final _wednesdayTasks = Hive.box("WEDNESDAY_TASKS");
  List wednesdayTasks = [];

  void loadWednesdayTasks() {
    wednesdayTasks =
        _wednesdayTasks.get("WEDNESDAY_TASKS", defaultValue: []) ?? [];
  }

  void saveWednesdayTaskss() {
    _wednesdayTasks.put("WEDNESDAY_TASKS", wednesdayTasks);
    notifyListeners();
  }

// thursday list
  final _thursdayTasks = Hive.box("THURSDAY_TASKS");
  List thursdayTasks = [];

  void loadThursdayTasks() {
    thursdayTasks =
        _thursdayTasks.get("THURSDAY_TASKS", defaultValue: []) ?? [];
  }

  void saveThursdayTasks() {
    _thursdayTasks.put("THURSDAY_TASKS", thursdayTasks);
    notifyListeners();
  }

// friday list
  final _fridayTasks = Hive.box("FRIDAY_TASKS");
  List fridayTasks = [];

  void loadFridayTasks() {
    fridayTasks = _fridayTasks.get("FRIDAY_TASKS", defaultValue: []) ?? [];
  }

  void saveFridayTasks() {
    _fridayTasks.put("FRIDAY_TASKS", fridayTasks);
    notifyListeners();
  }

// saturday list
  final _saturdayTasks = Hive.box("SATURDAY_TASKS");
  List saturdayTasks = [];

  void loadSaturdayTasks() {
    saturdayTasks =
        _saturdayTasks.get("SATURDAY_TASKS", defaultValue: []) ?? [];
  }

  void saveSaturdayTasks() {
    _saturdayTasks.put("SATURDAY_TASKS", saturdayTasks);
    notifyListeners();
  }
}
