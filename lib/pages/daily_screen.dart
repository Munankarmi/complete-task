import 'package:complete_task/providers/daily_provider.dart';
import 'package:complete_task/utilities/design_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DailyScreen extends StatefulWidget {
  const DailyScreen({super.key});

  @override
  State<DailyScreen> createState() => _DailyScreenState();
}

class _DailyScreenState extends State<DailyScreen> {
  // bool initialCheckValue = Provider.of<DailyProvider>(this, listen: true).dailyTasks[index][0];
  bool checkValue = false;
  final taskTextController = TextEditingController();
  final descpTextControlloer = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Consumer<DailyProvider>(
        builder: (context, value, child) {
          return ListView.builder(
            itemCount: value.dailyTasks.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  height: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    color: Colors.lightBlue,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black87,
                        offset: Offset(2, 2),
                        blurRadius: 8,
                        spreadRadius: 4,
                      ),
                      BoxShadow(
                        color: Colors.white,
                        offset: Offset(-2, -2),
                        blurRadius: 8,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 10, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Checkbox(
                              value: value.dailyTasks[index][0],
                              onChanged: (checkValue) {
                                setState(() {
                                  value.dailyTasks[index][0] = checkValue!;
                                });
                              },
                              checkColor: Colors.lightBlue,
                              activeColor: Colors.lightGreenAccent,
                            ),
                            SizedBox(width: 20),
                            Expanded(child: Text(value.dailyTasks[index][1])),
                            IconButton(
                                onPressed: () {
                                 showDialog(context: context, builder: (context){
                                  return DialogDesign(title: value.dailyTasks[index][1], subTitle: "Are you sure to delete this task?", buttonFunction: (){
                                    value.deleteDailyTask(index);
                                    Navigator.pop(context);
                                  });
                                 });
                                },
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.red[400],
                                )),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                                onPressed: () {}, icon: Icon(Icons.alarm)),
                            TextButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) => Center(
                                      child: Material(
                                        color: Colors.transparent,
                                        child: Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                      color:
                                                          Colors.grey.shade500,
                                                      offset: Offset(2, 2),
                                                      blurRadius: 4,
                                                      spreadRadius: 2),
                                                  BoxShadow(
                                                      color: Colors.white,
                                                      offset: Offset(-2, -2),
                                                      blurRadius: 4,
                                                      spreadRadius: 2)
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                color: Colors.lightBlueAccent),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(32.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  DesignText(
                                                    text: value
                                                        .dailyTasks[index][1],
                                                    boldText: true,
                                                    textSize: 24,
                                                  ),
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                  DesignText(
                                                    text: value
                                                        .dailyTasks[index][2],
                                                    textSize: 20,
                                                  ),
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                  DesignButton(
                                                      buttonText: 'Okay',
                                                      buttonFunction: () {
                                                        Navigator.pop(context);
                                                      })
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                child: DesignText(
                                  text: "Learn more..",
                                  textSize: 14,
                                ))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) => Center(
                    child: Material(
                      color: Colors.transparent,
                      child: Padding(
                        padding: const EdgeInsets.all(26.0),
                        child: Container(
                          // width: 300,
                          // height: 200,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.grey,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.blueGrey,
                                    offset: Offset(4, 4),
                                    blurRadius: 8,
                                    spreadRadius: 2),
                                BoxShadow(
                                    color: Colors.white,
                                    offset: Offset(-4, -4),
                                    blurRadius: 8,
                                    spreadRadius: 2)
                              ]),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              DesignText(
                                text: "Add Task",
                                boldText: true,
                                textSpace: 2,
                                textSize: 28,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: DesignTextField(
                                    hintText: 'Task',
                                    textController: taskTextController),
                              ),
                              // SizedBox(
                              //   height: 10,
                              // ),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: DesignTextField(
                                  hintText: "description",
                                  textController: descpTextControlloer,
                                  verticalSize: 36,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    DesignButton(
                                        buttonText: " Add ",
                                        buttonFunction: () {
                                          Provider.of<DailyProvider>(context,
                                                  listen: false)
                                              .addDailyTask(
                                                  checkValue,
                                                  taskTextController.text,
                                                  descpTextControlloer.text);
                                          taskTextController.clear();
                                          descpTextControlloer.clear();
                                          Navigator.pop(context);
                                        }),
                                    SizedBox(
                                      width: 40,
                                    ),
                                    DesignButton(
                                        buttonText: "Cancel",
                                        buttonFunction: () {
                                          taskTextController.clear();
                                          descpTextControlloer.clear();
                                          Navigator.pop(context);
                                        })
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
