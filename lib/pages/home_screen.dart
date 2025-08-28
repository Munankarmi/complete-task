import 'package:analog_clock/analog_clock.dart';
import 'package:complete_task/utilities/design_text.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellowAccent[200],
      body: Column(
        children: [
          SizedBox(height: 10,),
          AnalogClock(
            showAllNumbers: true,
            height: 250,
            secondHandColor: Colors.lightBlue,
          ),
          Divider(
            thickness: 1,
            color: Colors.lightBlue,
          ),
          TableCalendar(
            focusedDay: DateTime.now(),
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
          ),
          Divider(
            thickness: 1,
            color: Colors.lightBlue,
          ),
        ],
      ),
    );
  }
}
