import 'package:complete_task/providers/daily_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

extension Providers on BuildContext{
  DailyProvider get dailyProvider => Provider.of<DailyProvider>(this, listen: false);
}