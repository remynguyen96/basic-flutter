import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Util {
  static Padding paddingTop = Padding(
    padding: const EdgeInsets.only(top: 44),
  );
  static Padding paddingLeft = Padding(
    padding: const EdgeInsets.only(left: 12),
  );
  static TextStyle textStyle = TextStyle(fontSize: 24.0);
  static BoxDecoration textFieldDecoration = BoxDecoration(
    border: Border.all(),
    borderRadius: const BorderRadius.all(Radius.circular(10)),
  );

  static double calculateBMI(double height, double weight, int unit) {
    double result;
    if (unit == 0) {
      result = (weight / height / height) * 10000;
    } else {
      result = (weight / height / height) * 703;
    }
    return result;
  }

  static void saveSettings(int value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('unit', value);
  }

  static Future<int> getSettings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int result = prefs.getInt('unit');
    return result;
  }
}
