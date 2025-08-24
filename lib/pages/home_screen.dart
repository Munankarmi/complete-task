import 'package:complete_task/utilities/design_text.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: DesignText(text: "home screen"),
    );
  }
}