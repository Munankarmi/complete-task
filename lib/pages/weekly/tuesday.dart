import 'package:complete_task/providers/weekly_provider.dart';
import 'package:complete_task/utilities/design_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TuesdayTile extends StatefulWidget {
  const TuesdayTile({super.key});

  @override
  State<TuesdayTile> createState() => _TuesdayTileState();
}

class _TuesdayTileState extends State<TuesdayTile> {
  final tuesdayText = TextEditingController();
  final tuesdayDescp = TextEditingController();
  bool tuesdayCheckValue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: DesignText(
          text: 'Tuesday Tasks',
          boldText: true,
          textSize: 24,
        ),
        centerTitle: true,
      ),
      body: Consumer<WeeklyProvider>(
        builder: (context, value, child) {
          return ListView.builder(
              itemCount: value.tuesdayTasks.length,
              itemBuilder: (context, index) {
                return WeeklyListTile(
                  weeklyCheckValue: value.tuesdayTasks[index][0],
                  weeklyText: value.tuesdayTasks[index][1],
                  weeklyDescp: value.tuesdayTasks[index][2],
                  deleteButton: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return DialogDesign(
                              title: 'Delete task?',
                              subTitle:
                                  'Are you sure to delete ${value.tuesdayTasks[index][1]}',
                              buttonFunction: () {
                                value.deleteWeeklyTask(
                                    value.tuesdayTasks, index);
                                Navigator.pop(context);
                              });
                        });
                  },
                  descpButton: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return DialogDesign(
                              title: '${value.tuesdayTasks[index][1]}',
                              subTitle: '${value.tuesdayTasks[index][2]}',
                              buttonFunction: () => Navigator.pop(context));
                        });
                  },
                  checkValueFun: (tuesdayCheckValue) {
                    setState(() {
                      value.tuesdayTasks[index][0] = tuesdayCheckValue!;
                    });
                    value.saveTuesdayTasks();
                  },
                );
              });
        },
      ),
      floatingActionButton:
          Consumer<WeeklyProvider>(builder: (context, provider, child) {
        return FloatingActionButton(
          backgroundColor: Colors.lightBlue,
          onPressed: () {
            tuesdayText.clear();
            tuesdayDescp.clear();
            showDialog(
                context: context,
                builder: (context) {
                  return weeklyTaskDesign(
                      weeklyText: 'Tuesday Task',
                      addFunction: () {
                        provider.addWeeklyTask(
                            provider.tuesdayTasks,
                            tuesdayCheckValue,
                            tuesdayText.text,
                            tuesdayDescp.text);
                        tuesdayText.clear();
                        tuesdayDescp.clear();
                        Navigator.pop(context);
                      },
                      textController: tuesdayText,
                      descpController: tuesdayDescp);
                });
          },
          child: Icon(Icons.add),
        );
      }),
    );
  }
}
