import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper {
  static const String inputKey = 'inputKey';
  static const String branchCounterKey = 'branchCounter';
  static late SharedPreferences _preferences;

  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  Future<String?> loadSavedInput() async {
    return _preferences.getString(inputKey);
  }

  Future<void> saveInput(String input, BuildContext context) async {
    await _preferences.setString(inputKey, input);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('تم حفظ النص بنجاح!')),
    );
  }

  Future<int> incrementPageCount() async {
    int pageNum = _preferences.getInt(branchCounterKey) ?? 0;
    await _preferences.setInt(branchCounterKey, pageNum + 1);
    return pageNum + 1;
  }

  int getPageCount() {
    return _preferences.getInt(branchCounterKey) ?? 0;
  }
}
