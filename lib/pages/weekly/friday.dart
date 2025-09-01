import 'package:complete_task/providers/weekly_provider.dart';
import 'package:complete_task/utilities/design_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FirdayTile extends StatefulWidget {
  const FirdayTile({super.key});

  @override
  State<FirdayTile> createState() => _FirdayTileState();
}

class _FirdayTileState extends State<FirdayTile> {
  final fridayText = TextEditingController();
  final fridayDescp = TextEditingController();
  bool fridayCheckValue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreenAccent,
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Text('Friday Tasks'),
        centerTitle: true,
      ),
      body: Consumer<WeeklyProvider>(
        builder: (context, value, child) {
          return ListView.builder(
              itemCount: value.fridayTasks.length,
              itemBuilder: (context, index) {
                return WeeklyListTile(
                  weeklyCheckValue: value.fridayTasks[index][0],
                  weeklyText: value.fridayTasks[index][1],
                  weeklyDescp: value.fridayTasks[index][2],
                  deleteButton: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return DialogDesign(
                              title: 'Delete task?',
                              subTitle:
                                  'Are you sure to delete ${value.fridayTasks[index][1]}',
                              buttonFunction: () {
                                value.deleteWeeklyTask(
                                    value.fridayTasks, index);
                                Navigator.pop(context);
                              });
                        });
                  },
                  descpButton: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return DialogDesign(
                              title: '${value.fridayTasks[index][1]}',
                              subTitle: '${value.fridayTasks[index][2]}',
                              buttonFunction: () => Navigator.pop(context));
                        });
                  },
                  checkValueFun: (fridayCheckValue) {
                    setState(() {
                      value.fridayTasks[index][0] = fridayCheckValue!;
                    });
                    value.saveFridayTasks();
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
            fridayText.clear();
            fridayDescp.clear();
            showDialog(
                context: context,
                builder: (context) {
                  return weeklyTaskDesign(
                      weeklyText: 'Friday Task',
                      addFunction: () {
                        provider.addWeeklyTask(
                            provider.fridayTasks,
                            fridayCheckValue,
                            fridayText.text,
                            fridayDescp.text);
                        fridayText.clear();
                        fridayDescp.clear();
                        Navigator.pop(context);
                      },
                      textController: fridayText,
                      descpController: fridayDescp);
                });
          },
          child: Icon(Icons.add),
        );
      }),
    );
  }
}
