import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomContainer extends StatefulWidget {
  const CustomContainer({
    super.key,
    required this.textFieldLabel,
    required this.containerWidth,
    this.containerHeight = 50.0,
    this.padding = const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
    this.margin = const EdgeInsets.all(10),
    this.borderColor = Colors.grey,
    required this.inputKey,
  });

  final String textFieldLabel;
  final double containerWidth;
  final double containerHeight;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final Color borderColor;
  final String inputKey;

  @override
  State<CustomContainer> createState() => _CustomContainerState();
}

class _CustomContainerState extends State<CustomContainer> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadSavedInput();
  }

  Future<void> _loadSavedInput() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? savedInput = sharedPreferences.getString(widget.inputKey);
    if (savedInput != null) {
      _controller.text = savedInput;
    }
  }

  Future<void> saveInput() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(widget.inputKey, _controller.text);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('تم حفظ النص بنجاح!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.containerWidth,
      height: widget.containerHeight,
      padding: widget.padding,
      margin: widget.margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: widget.borderColor),
      ),
      child: TextField(
        controller: _controller,
        decoration: InputDecoration(
          hintText: widget.textFieldLabel,
          border: InputBorder.none,
          hintStyle: TextStyle(
            color: Colors.grey,
            fontSize: 16.0,
            fontWeight: FontWeight.w400,
          ),
        ),
        onSubmitted: (value) {
          saveInput();
        },
      ),
    );
  }
}