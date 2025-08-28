import 'package:alarm/alarm.dart';
import 'package:alarm/model/alarm_settings.dart';
import 'package:alarm/model/volume_settings.dart';
import 'package:alarm/model/notification_settings.dart';
import 'package:complete_task/providers/daily_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DesignText extends StatelessWidget {
  final String text;
  final Color textColor;
  final bool boldText;
  final double textSize;
  final double textSpace;
  const DesignText(
      {this.textColor = Colors.black,
      this.boldText = false,
      this.textSize = 18,
      this.textSpace = 0,
      required this.text,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: textColor,
          fontWeight: boldText ? FontWeight.bold : FontWeight.normal,
          fontSize: textSize,
          letterSpacing: textSpace),
    );
  }
}

class DesignTextField extends StatelessWidget {
  final TextEditingController textController;
  final String hintText;
  final double verticalSize;
  final double horizontalSize;
  const DesignTextField(
      {this.horizontalSize = 12.0,
      this.verticalSize = 12.0,
      required this.hintText,
      required this.textController,
      super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textController,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
            vertical: verticalSize, horizontal: horizontalSize),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black87),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.lightBlueAccent),
        ),
        fillColor: Colors.white,
        filled: true,
        hintText: hintText,
      ),
    );
  }
}

class DesignButton extends StatelessWidget {
  final void Function()? buttonFunction;
  final String buttonText;
  const DesignButton(
      {required this.buttonText, required this.buttonFunction, super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: buttonFunction,
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      )),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: DesignText(
          text: buttonText,
          boldText: true,
          textSize: 20,
        ),
      ),
    );
  }
}

class DialogDesign extends StatelessWidget {
  final String title;
  final String subTitle;
  final void Function()? buttonFunction;
  const DialogDesign(
      {required this.title,
      required this.subTitle,
      required this.buttonFunction,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Container(
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade500,
                    offset: Offset(4, 4),
                    blurRadius: 4,
                    spreadRadius: 2),
                BoxShadow(
                    color: Colors.white,
                    offset: Offset(-2, -2),
                    blurRadius: 4,
                    spreadRadius: 2)
              ],
              borderRadius: BorderRadius.circular(12),
              color: Colors.lightBlueAccent),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 20,
              ),
              DesignText(
                text: title,
                boldText: true,
                textSize: 24,
              ),
              SizedBox(
                height: 10,
              ),
              DesignText(text: subTitle),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    DesignButton(
                        buttonText: " Okay ", buttonFunction: buttonFunction),
                    DesignButton(
                        buttonText: "Cancel",
                        buttonFunction: () => Navigator.pop(context))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class NotifyTask extends StatelessWidget {
  final DateTime? alarmTime;
  NotifyTask({this.alarmTime, super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () async {
          final TimeOfDay? pickedTime = await showTimePicker(
            context: context,
            initialTime: TimeOfDay.now(),
          );
          if (pickedTime != null) {
            final now = DateTime.now();
            DateTime alarmDateTime = DateTime(now.year, now.month, now.day,
                pickedTime.hour, pickedTime.minute);

            if (alarmDateTime.isBefore(now)) {
              alarmDateTime = alarmDateTime.add(Duration(days: 1));
            }

            final alarmSettings = AlarmSettings(
              id: DateTime.now().millisecond,
              dateTime: alarmDateTime,
              assetAudioPath: 'null',
              // 'lib/assets/sounds/alarm.mp3',
              loopAudio: true,
              vibrate: true,
              volumeSettings: VolumeSettings.fade(
                volume: 0.8,
                fadeDuration: Duration(seconds: 5),
                volumeEnforced: true,
              ),
              notificationSettings: NotificationSettings(
                title: 'Task Alert !!!',
                body: Provider.of<DailyProvider>(context, listen: false)
                    .dailyTasks[0][1],
                stopButton: 'Stop',
                icon: 'notification_icon',
                iconColor: Color(0xff862778),
              ),
            );
            await Alarm.set(alarmSettings: alarmSettings);

            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("Alarm set at ${pickedTime.format(context)}")));
          }
        },
        icon: Icon(Icons.alarm));
  }
}

class DayDesign extends StatelessWidget {
  final String weeklyLetter;
  final String weeklyFullLetter;
  final Color weeklyCollor;
  final void Function()? weeklyFunction;
  DayDesign(
      {this.weeklyCollor = Colors.white,
      required this.weeklyLetter,
      required this.weeklyFullLetter,
      required this.weeklyFunction,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: ElevatedButton(
        onPressed: weeklyFunction,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          backgroundColor: weeklyCollor,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: DesignText(
                text: weeklyLetter,
                boldText: true,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: DesignText(
                text: weeklyFullLetter,
                textSize: 10,
                boldText: true,
              ),
            )
          ],
        ),
      ),
    );
  }
}

// this is a common list tile design made for all days where we can get checkBox, task text, task descp and delete button
class WeeklyListTile extends StatelessWidget {
  bool weeklyCheckValue = false;
  final String weeklyText;
  final String weeklyDescp;
  final void Function()? deleteButton;
  final void Function()? descpButton;
  final void Function(bool?)? checkValueFun;
  WeeklyListTile(
      {required this.weeklyCheckValue,
      required this.weeklyText,
      required this.weeklyDescp,
      required this.deleteButton,
      required this.descpButton,
      required this.checkValueFun,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Container(
          decoration: BoxDecoration(
              color: Colors.lightBlueAccent,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade500,
                    offset: Offset(4, 4),
                    blurRadius: 4,
                    spreadRadius: 2),
                BoxShadow(
                    color: Colors.white,
                    offset: Offset(-4, -4),
                    blurRadius: 4,
                    spreadRadius: 2)
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Checkbox(value: weeklyCheckValue, onChanged: checkValueFun),
                  DesignText(text: weeklyText),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: deleteButton,
                  )
                ],
              ),
              TextButton(
                onPressed: descpButton,
                child: Text('Learn more..'),
              ),
            ],
          )),
    );
  }
}

class weeklyTaskDesign extends StatelessWidget {
  final String weeklyText;
  final TextEditingController textController;
  final TextEditingController descpController;
  final void Function()? addFunction;
  const weeklyTaskDesign(
      {required this.weeklyText,
      required this.addFunction,
      required this.textController,
      required this.descpController,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.lightBlue,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade500,
                      offset: Offset(4, 4),
                      blurRadius: 4,
                      spreadRadius: 2),
                  BoxShadow(
                      color: Colors.white,
                      offset: Offset(-2, -2),
                      blurRadius: 2,
                      spreadRadius: 2)
                ]),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  DesignText(
                    text: weeklyText,
                    boldText: true,
                    textSize: 24,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  DesignTextField(
                      hintText: 'Task', textController: textController),
                  SizedBox(
                    height: 10,
                  ),
                  DesignTextField(
                      hintText: 'Description',
                      textController: descpController,
                      verticalSize: 28,
                      ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      DesignButton(
                          buttonText: ' Add ', buttonFunction: addFunction),
                      DesignButton(
                          buttonText: 'Cancel',
                          buttonFunction: () => Navigator.pop(context))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
