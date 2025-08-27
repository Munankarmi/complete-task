import 'package:complete_task/utilities/design_text.dart';
import 'package:flutter/material.dart';

class WeeklyScreen extends StatelessWidget {
  const WeeklyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellowAccent[200],
      body: DesignText(text: 'weekly screen'),
    );
  }
}