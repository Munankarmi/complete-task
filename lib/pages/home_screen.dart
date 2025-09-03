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
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(60, 0, 60, 0),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.yellowAccent,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade500,
                      offset: Offset(4, 4),
                      blurRadius: 16,
                      spreadRadius: 1),
                  BoxShadow(
                      color: Colors.white,
                      offset: Offset(-4, -4),
                      blurRadius: 16,
                      spreadRadius: 1)
                ],
              ),
              child: AnalogClock(
                showAllNumbers: true,
                height: 250,
                secondHandColor: Colors.lightBlue,
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Divider(
            thickness: 1,
            color: Colors.lightBlue,
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.yellowAccent,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.shade500,
                        offset: Offset(4, 4),
                        blurRadius: 16,
                        spreadRadius: 4),
                    BoxShadow(
                        color: Colors.white,
                        offset: Offset(-4, -4),
                        blurRadius: 16,
                        spreadRadius: 4)
                  ],
                  borderRadius: BorderRadius.circular(8)),
              child: TableCalendar(
                focusedDay: DateTime.now(),
                firstDay: DateTime.utc(2010, 10, 16),
                lastDay: DateTime.utc(2030, 3, 14),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
