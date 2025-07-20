import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsKeys {
  static const String mostRecentKey = 'most_recent';
}

Future<void> saveNewSuraList(int newSuraIndex) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String> mostRecntIndeicesList =
      prefs.getStringList(SharedPrefsKeys.mostRecentKey) ?? [];
  if (mostRecntIndeicesList.contains('$newSuraIndex')) {
    mostRecntIndeicesList.remove('$newSuraIndex');
    mostRecntIndeicesList.insert(0, '$newSuraIndex');
  } else {
    mostRecntIndeicesList.insert(0, '$newSuraIndex');
  }
  if (mostRecntIndeicesList.length > 5) {
    // mostRecntIndeicesList.removeLast();
    mostRecntIndeicesList = mostRecntIndeicesList.sublist(0, 5);
  }
  await prefs.setStringList(
    SharedPrefsKeys.mostRecentKey,
    mostRecntIndeicesList,
  );
}
