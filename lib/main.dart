import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task1/app_root.dart';


void main() {
  runApp(AppRoot());
}


  class SharedPreference {
  static get inputKey => inputKey;

  Future<void> loadSavedInput() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  String? savedData = sharedPreferences.getString(inputKey);

  }

  Future<void>saveInput(BuildContext context)async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  await sharedPreferences.setString(inputKey,_controller);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('تم حفظ النص بنجاح!')),
    );
  }
}