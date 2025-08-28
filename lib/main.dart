import 'package:alarm/alarm.dart';
import 'package:complete_task/pages/home_page.dart';
import 'package:complete_task/providers/daily_provider.dart';
import 'package:complete_task/providers/weekly_provider.dart';
import 'package:flutter/material.dart';
import 'package:hive_ce/hive.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox("DAILY_TASKS");
  await Hive.openBox("SUNDAY_TASKS");
  await Hive.openBox("MONDAY_TASKS");
  await Hive.openBox("TUESDAY_TASKS");
  await Hive.openBox("WEDNESDAY_TASKS");
  await Hive.openBox("THURSDAY_TASKS");
  await Hive.openBox("FRIDAY_TASKS");
  await Hive.openBox("SATURDAY_TASKS");
  await Alarm.init();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => DailyProvider()),
      ChangeNotifierProvider(create: (context) => WeeklyProvider())
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
