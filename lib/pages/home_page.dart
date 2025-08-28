import 'package:complete_task/pages/daily_screen.dart';
import 'package:complete_task/pages/home_screen.dart';
import 'package:complete_task/pages/weekly/weekly_screen.dart';
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
      backgroundColor: Colors.yellowAccent[200],
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
        backgroundColor: Colors.lightBlueAccent,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home, color: Colors.black, size: 32,), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.checklist, color: Colors.black, size: 32,), label: 'Daily Tasks'),
          BottomNavigationBarItem(
              icon: Icon(Icons.checklist, color: Colors.black, size: 32,), label: 'Weekly Tasks')
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
