import 'package:complete_task/pages/daily_screen.dart';
import 'package:complete_task/pages/home_screen.dart';
import 'package:complete_task/pages/weekly_screen.dart';
import 'package:complete_task/utilities/design_text.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndexBar = 0;
  final List<Widget> pages = [HomeScreen(), DailyScreen(), WeeklyScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        shadowColor: Colors.white,
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(8)),
        title: Column(
          children: [
            DesignText(
              text: 'ACDT',
              boldText: true,
              textSize: 24,
              textSpace: 2,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: DesignText(
                text: "Add, Complete and Delete tasks",
                boldText: true,
              ),
            )
          ],
        ),
        centerTitle: true,
      ),
      body: pages[currentIndexBar],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.checklist), label: 'Daily Tasks'),
          BottomNavigationBarItem(
              icon: Icon(Icons.checklist), label: 'Weekly Tasks')
        ],
        currentIndex: currentIndexBar,
        onTap: (int index) {
          selectedBottomNav(index);
        },
      ),
    );
  }

  void selectedBottomNav(index) {
    setState(() {
      currentIndexBar = index;
    });
  }
}
