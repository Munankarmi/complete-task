import 'package:complete_task/pages/weekly/friday.dart';
import 'package:complete_task/pages/weekly/monday.dart';
import 'package:complete_task/pages/weekly/saturday.dart';
import 'package:complete_task/pages/weekly/sunday.dart';
import 'package:complete_task/pages/weekly/thursday.dart';
import 'package:complete_task/pages/weekly/tuesday.dart';
import 'package:complete_task/pages/weekly/wednesday.dart';
import 'package:complete_task/providers/weekly_provider.dart';
import 'package:complete_task/utilities/design_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

class WeeklyScreen extends StatelessWidget {
  const WeeklyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.yellowAccent[200],
        body: Consumer<WeeklyProvider>(builder: (context, value, child) {
          return Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  DayDesign(
                    weeklyLetter: 'Sun',
                    weeklyFullLetter: 'Sunday',
                    weeklyFunction: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return SundayTile();
                          });
                    },
                    weeklyCollor: Colors.lightGreenAccent,
                  ),
                  DayDesign(
                    weeklyLetter: 'Mon',
                    weeklyFullLetter: 'Monday',
                    weeklyFunction: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return MondayTile();
                          });
                    },
                    weeklyCollor: Colors.orange,
                  ),
                  DayDesign(
                    weeklyLetter: 'Tue',
                    weeklyFullLetter: 'Tuesday',
                    weeklyFunction: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return TuesdayTile();
                          });
                    },
                    weeklyCollor: Colors.redAccent,
                  ),
                  DayDesign(
                    weeklyLetter: 'Wed',
                    weeklyFullLetter: 'Wednesday',
                    weeklyFunction: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return WednesdayTile();
                          });
                    },
                    weeklyCollor: Colors.redAccent,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  DayDesign(
                    weeklyLetter: 'Thu',
                    weeklyFullLetter: 'Thursday',
                    weeklyFunction: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return ThursdayTile();
                          });
                    },
                    weeklyCollor: Colors.orange,
                  ),
                  DayDesign(
                    weeklyLetter: 'Fri',
                    weeklyFullLetter: 'Friday',
                    weeklyFunction: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return FirdayTile();
                          });
                    },
                    weeklyCollor: Colors.lightGreenAccent,
                  ),
                  DayDesign(
                    weeklyLetter: 'Sat',
                    weeklyFullLetter: 'Saturday',
                    weeklyFunction: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return SaturdayTile();
                          });
                    },
                    weeklyCollor: Colors.green,
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Divider(
                thickness: 2,
                color: Colors.lightBlue,
              ),
              SizedBox(
                height: 20,
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
              )
            ],
          );
        }));
  }
}
