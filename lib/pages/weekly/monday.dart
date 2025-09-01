import 'package:complete_task/providers/weekly_provider.dart';
import 'package:complete_task/utilities/design_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MondayTile extends StatefulWidget {
  const MondayTile({super.key});

  @override
  State<MondayTile> createState() => _MondayTileState();
}

class _MondayTileState extends State<MondayTile> {
  final mondayTask = TextEditingController();
  final mondayDescp = TextEditingController();
  bool mondayCheckValue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Text('Monday Tasks'),
        centerTitle: true,
      ),
      body: Consumer<WeeklyProvider>(
        builder: (context, value, child) {
          return ListView.builder(
              itemCount: value.mondayTasks.length,
              itemBuilder: (context, index) {
                return WeeklyListTile(
                  weeklyCheckValue: value.mondayTasks[index][0],
                  weeklyText: value.mondayTasks[index][1],
                  weeklyDescp: value.mondayTasks[index][2],
                  deleteButton: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return DialogDesign(
                              title: 'Delete task?',
                              subTitle:
                                  'Are you sure to delete ${value.mondayTasks[index][1]}',
                              buttonFunction: () {
                                value.deleteWeeklyTask(
                                    value.mondayTasks, index);
                                Navigator.pop(context);
                              });
                        });
                  },
                  descpButton: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return DialogDesign(
                              title: '${value.mondayTasks[index][1]}',
                              subTitle: '${value.mondayTasks[index][2]}',
                              buttonFunction: () => Navigator.pop(context));
                        });
                  },
                  checkValueFun: (mondayCheckValue) {
                    setState(() {
                      value.mondayTasks[index][0] = mondayCheckValue!;
                    });
                    value.saveMondayTasks();
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
            mondayTask.clear();
            mondayDescp.clear();
            showDialog(
                context: context,
                builder: (context) {
                  return weeklyTaskDesign(
                      weeklyText: 'Monday Task',
                      addFunction: () {
                        provider.addWeeklyTask(
                            provider.mondayTasks,
                            mondayCheckValue,
                            mondayTask.text,
                            mondayDescp.text);
                        mondayTask.clear();
                        mondayDescp.clear();
                        Navigator.pop(context);
                      },
                      textController: mondayTask,
                      descpController: mondayDescp);
                });
          },
          child: Icon(Icons.add),
        );
      }),
    );
  }
}
