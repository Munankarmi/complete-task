import 'package:complete_task/providers/daily_provider.dart';
import 'package:complete_task/providers/weekly_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

extension Providers on BuildContext{
  DailyProvider get dailyProvider => Provider.of<DailyProvider>(this, listen: false);
  WeeklyProvider get weeklyProvider => Provider.of<WeeklyProvider>(this, listen: false);
}