import 'package:complete_task/pages/weekly/monday.dart';
import 'package:complete_task/pages/weekly/sunday.dart';
import 'package:complete_task/providers/weekly_provider.dart';
import 'package:complete_task/utilities/design_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
                    weeklyFunction: () {},
                    weeklyCollor: Colors.redAccent,
                  ),
                  DayDesign(
                    weeklyLetter: 'Wed',
                    weeklyFullLetter: 'Wednesday',
                    weeklyFunction: () {},
                    weeklyCollor: Colors.redAccent,
                  ),
                  DayDesign(
                    weeklyLetter: 'Thu',
                    weeklyFullLetter: 'Thursday',
                    weeklyFunction: () {},
                    weeklyCollor: Colors.orange,
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  DayDesign(
                    weeklyLetter: 'Fri',
                    weeklyFullLetter: 'Friday',
                    weeklyFunction: () {},
                    weeklyCollor: Colors.lightGreenAccent,
                  ),
                  DayDesign(
                    weeklyLetter: 'Sat',
                    weeklyFullLetter: 'Saturday',
                    weeklyFunction: () {},
                    weeklyCollor: Colors.green,
                  ),
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
                  )
                ],
              ),
              Divider(
                thickness: 2,
                color: Colors.lightBlue,
              ),
              Container(
                child: WeeklyListTile(
                  weeklyCheckValue: false,
                  weeklyText: 'taskq',
                  weeklyDescp: 'This is task for test1 ',
                  deleteButton: () {},
                  checkValueFun: (p0) {},
                  descpButton: () {},
                ),
              )
            ],
          );
        }));
  }
}
