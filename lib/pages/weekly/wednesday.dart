import 'package:complete_task/providers/weekly_provider.dart';
import 'package:complete_task/utilities/design_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WednesdayTile extends StatefulWidget {
  const WednesdayTile({super.key});

  @override
  State<WednesdayTile> createState() => _WednesdayTileState();
}

class _WednesdayTileState extends State<WednesdayTile> {
  final wednesdayText = TextEditingController();
  final wednesdayDescp = TextEditingController();
  bool wednesdayCheckValue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: DesignText(
          text: 'Wednesday Tasks',
          boldText: true,
          textSize: 24,
        ),
        centerTitle: true,
      ),
      body: Consumer<WeeklyProvider>(
        builder: (context, value, child) {
          return ListView.builder(
              itemCount: value.wednesdayTasks.length,
              itemBuilder: (context, index) {
                return WeeklyListTile(
                  weeklyCheckValue: value.wednesdayTasks[index][0],
                  weeklyText: value.wednesdayTasks[index][1],
                  weeklyDescp: value.wednesdayTasks[index][2],
                  deleteButton: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return DialogDesign(
                              title: 'Delete task?',
                              subTitle:
                                  'Are you sure to delete ${value.wednesdayTasks[index][1]}',
                              buttonFunction: () {
                                value.deleteWeeklyTask(
                                    value.wednesdayTasks, index);
                                Navigator.pop(context);
                              });
                        });
                  },
                  descpButton: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return DialogDesign(
                              title: '${value.wednesdayTasks[index][1]}',
                              subTitle: '${value.wednesdayTasks[index][2]}',
                              buttonFunction: () => Navigator.pop(context));
                        });
                  },
                  checkValueFun: (wednesdayCheckValue) {
                    setState(() {
                      value.wednesdayTasks[index][0] = wednesdayCheckValue!;
                    });
                    value.saveWednesdayTaskss();
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
            wednesdayText.clear();
            wednesdayDescp.clear();
            showDialog(
                context: context,
                builder: (context) {
                  return weeklyTaskDesign(
                      weeklyText: 'Wednesday Task',
                      addFunction: () {
                        provider.addWeeklyTask(
                            provider.wednesdayTasks,
                            wednesdayCheckValue,
                            wednesdayText.text,
                            wednesdayDescp.text);
                        wednesdayText.clear();
                        wednesdayDescp.clear();
                        Navigator.pop(context);
                      },
                      textController: wednesdayText,
                      descpController: wednesdayDescp);
                });
          },
          child: Icon(Icons.add),
        );
      }),
    );
  }
}
