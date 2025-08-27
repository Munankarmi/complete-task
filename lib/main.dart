import 'package:alarm/alarm.dart';
import 'package:complete_task/pages/home_page.dart';
import 'package:complete_task/providers/daily_provider.dart';
import 'package:flutter/material.dart';
import 'package:hive_ce/hive.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox("MY_BOX");
  await Alarm.init();
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (context) => DailyProvider())],
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
