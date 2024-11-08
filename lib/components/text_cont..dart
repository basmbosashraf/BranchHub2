import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomContainer extends StatefulWidget {
  const CustomContainer({
    super.key,
    required this.textFieldLabel,
    required this.inputKey,
    required this.height,
    required this.width,
    this.padding = const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
    this.margin = const EdgeInsets.all(10),
    this.borderColor = Colors.grey,
    required this.controller,
  });

  final String textFieldLabel;
  final String inputKey;
  final double height;
  final double width;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final Color borderColor;
  final TextEditingController controller;

  @override
  State<CustomContainer> createState() => _CustomContainerState();
}

class _CustomContainerState extends State<CustomContainer> {
  Future<void> saveInput(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (value.isNotEmpty) {
      await prefs.setString(widget.inputKey, value);
    }
  }

  @override
  void initState() {
    super.initState();
    _loadSavedInput();
  }

  Future<void> _loadSavedInput() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? savedInput = prefs.getString(widget.inputKey);
    if (savedInput != null) {
      setState(() {
        widget.controller.text = savedInput;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      padding: widget.padding,
      margin: widget.margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: widget.borderColor),
      ),
      child: TextField(
        controller: widget.controller,
        decoration: InputDecoration(
          hintText: widget.textFieldLabel,
          border: InputBorder.none,
          hintStyle: TextStyle(
            color: Colors.grey,
            fontSize: 16.0,
            fontWeight: FontWeight.w400,
          ),
        ),
        onChanged: saveInput,
      ),
    );
  }
}
