import 'package:complete_task/providers/weekly_provider.dart';
import 'package:complete_task/utilities/design_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SaturdayTile extends StatefulWidget {
  const SaturdayTile({super.key});

  @override
  State<SaturdayTile> createState() => _SaturdayTileState();
}

class _SaturdayTileState extends State<SaturdayTile> {
  final saturdayText = TextEditingController();
  final saturdayDescp = TextEditingController();
  bool saturdayCheckValue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: DesignText(
          text: 'Saturday Tasks',
          boldText: true,
          textSize: 24,
        ),
        centerTitle: true,
      ),
      body: Consumer<WeeklyProvider>(
        builder: (context, value, child) {
          return ListView.builder(
              itemCount: value.saturdayTasks.length,
              itemBuilder: (context, index) {
                return WeeklyListTile(
                  weeklyCheckValue: value.saturdayTasks[index][0],
                  weeklyText: value.saturdayTasks[index][1],
                  weeklyDescp: value.saturdayTasks[index][2],
                  deleteButton: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return DialogDesign(
                              title: 'Delete task?',
                              subTitle:
                                  'Are you sure to delete ${value.saturdayTasks[index][1]}',
                              buttonFunction: () {
                                value.deleteWeeklyTask(
                                    value.saturdayTasks, index);
                                Navigator.pop(context);
                              });
                        });
                  },
                  descpButton: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return DialogDesign(
                              title: '${value.saturdayTasks[index][1]}',
                              subTitle: '${value.saturdayTasks[index][2]}',
                              buttonFunction: () => Navigator.pop(context));
                        });
                  },
                  checkValueFun: (saturdayCheckValue) {
                    setState(() {
                      value.saturdayTasks[index][0] = saturdayCheckValue!;
                    });
                    value.saveSaturdayTasks();
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
            saturdayText.clear();
            saturdayDescp.clear();
            showDialog(
                context: context,
                builder: (context) {
                  return weeklyTaskDesign(
                      weeklyText: 'Saturday Task',
                      addFunction: () {
                        provider.addWeeklyTask(
                            provider.saturdayTasks,
                            saturdayCheckValue,
                            saturdayText.text,
                            saturdayDescp.text);
                        saturdayText.clear();
                        saturdayDescp.clear();
                        Navigator.pop(context);
                      },
                      textController: saturdayText,
                      descpController: saturdayDescp);
                });
          },
          child: Icon(Icons.add),
        );
      }),
    );
  }
}
