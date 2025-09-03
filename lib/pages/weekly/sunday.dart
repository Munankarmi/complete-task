import 'package:complete_task/providers/weekly_provider.dart';
import 'package:complete_task/utilities/design_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SundayTile extends StatefulWidget {
  const SundayTile({super.key});

  @override
  State<SundayTile> createState() => _SundayTileState();
}

class _SundayTileState extends State<SundayTile> {
  final sundayTask = TextEditingController();
  final sundayDescp = TextEditingController();
  bool sundayCheckValue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreenAccent,
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: DesignText(
          text: 'Sunday Tasks',
          boldText: true,
          textSize: 24,
        ),
        centerTitle: true,
      ),
      body: Consumer<WeeklyProvider>(
        builder: (context, value, child) {
          return ListView.builder(
              itemCount: value.sundayTasks.length,
              itemBuilder: (context, index) {
                return WeeklyListTile(
                  weeklyCheckValue: value.sundayTasks[index][0],
                  weeklyText: value.sundayTasks[index][1],
                  weeklyDescp: value.sundayTasks[index][2],
                  deleteButton: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return DialogDesign(
                              title: 'Delete task?',
                              subTitle:
                                  'Are you sure to delete ${value.sundayTasks[index][1]}',
                              buttonFunction: () {
                                value.deleteWeeklyTask(
                                    value.sundayTasks, index);
                                Navigator.pop(context);
                              });
                        });
                  },
                  descpButton: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return DialogDesign(
                              title: '${value.sundayTasks[index][1]}',
                              subTitle: '${value.sundayTasks[index][2]}',
                              buttonFunction: () => Navigator.pop(context));
                        });
                  },
                  checkValueFun: (sundayCheckValue) {
                    setState(() {
                      value.sundayTasks[index][0] = sundayCheckValue!;
                    });
                    value.saveSundayTasks();
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
            sundayTask.clear();
            sundayDescp.clear();
            showDialog(
                context: context,
                builder: (context) {
                  return weeklyTaskDesign(
                      weeklyText: 'Sunday Task',
                      addFunction: () {
                        provider.addWeeklyTask(
                            provider.sundayTasks,
                            sundayCheckValue,
                            sundayTask.text,
                            sundayDescp.text);
                        sundayTask.clear();
                        sundayDescp.clear();
                        Navigator.pop(context);
                      },
                      textController: sundayTask,
                      descpController: sundayDescp);
                });
          },
          child: Icon(Icons.add),
        );
      }),
    );
  }
}
