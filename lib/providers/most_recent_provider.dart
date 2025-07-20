import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/shared_preferences.dart';

class MostRecentProvider extends ChangeNotifier {
  List<int> mostRecentList = [];

  void getMostRecentSuraList() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> mostRecntIndicesAsString =
        prefs.getStringList(SharedPrefsKeys.mostRecentKey) ?? [];
    mostRecentList = mostRecntIndicesAsString.map((e) => int.parse(e)).toList();
    notifyListeners();
  }
}
