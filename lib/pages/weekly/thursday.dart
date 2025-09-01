import 'package:complete_task/providers/weekly_provider.dart';
import 'package:complete_task/utilities/design_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThursdayTile extends StatefulWidget {
  const ThursdayTile({super.key});

  @override
  State<ThursdayTile> createState() => _ThursdayTileState();
}

class _ThursdayTileState extends State<ThursdayTile> {
  final thursdayText = TextEditingController();
  final thursdayDescp = TextEditingController();
  bool thursdayCheckValue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Text('Thursday Tasks'),
        centerTitle: true,
      ),
      body: Consumer<WeeklyProvider>(
        builder: (context, value, child) {
          return ListView.builder(
              itemCount: value.thursdayTasks.length,
              itemBuilder: (context, index) {
                return WeeklyListTile(
                  weeklyCheckValue: value.thursdayTasks[index][0],
                  weeklyText: value.thursdayTasks[index][1],
                  weeklyDescp: value.thursdayTasks[index][2],
                  deleteButton: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return DialogDesign(
                              title: 'Delete task?',
                              subTitle:
                                  'Are you sure to delete ${value.thursdayTasks[index][1]}',
                              buttonFunction: () {
                                value.deleteWeeklyTask(
                                    value.thursdayTasks, index);
                                Navigator.pop(context);
                              });
                        });
                  },
                  descpButton: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return DialogDesign(
                              title: '${value.thursdayTasks[index][1]}',
                              subTitle: '${value.thursdayTasks[index][2]}',
                              buttonFunction: () => Navigator.pop(context));
                        });
                  },
                  checkValueFun: (thursdayCheckValue) {
                    setState(() {
                      value.thursdayTasks[index][0] = thursdayCheckValue!;
                    });
                    value.saveThursdayTasks();
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
            thursdayText.clear();
            thursdayDescp.clear();
            showDialog(
                context: context,
                builder: (context) {
                  return weeklyTaskDesign(
                      weeklyText: 'Thursday Task',
                      addFunction: () {
                        provider.addWeeklyTask(
                            provider.thursdayTasks,
                            thursdayCheckValue,
                            thursdayText.text,
                            thursdayDescp.text);
                        thursdayText.clear();
                        thursdayDescp.clear();
                        Navigator.pop(context);
                      },
                      textController: thursdayText,
                      descpController: thursdayDescp);
                });
          },
          child: Icon(Icons.add),
        );
      }),
    );
  }
}
