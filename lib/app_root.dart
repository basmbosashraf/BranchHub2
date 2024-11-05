import 'package:flutter/material.dart';
import 'package:task1/home_screen.dart';
import 'package:task1/text_cont..dart';

class AppRoot extends StatefulWidget {
  const AppRoot({super.key});
  final int branch_counter = 0;

  @override
  State<AppRoot> createState() => _AppRootState();
}

class _AppRootState extends State<AppRoot> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:HomeScreen(inputKey: '',),
    );
  }
}













