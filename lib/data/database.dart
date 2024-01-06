import 'package:shared_preferences/shared_preferences.dart';

class Database {
  // Intialize Data if No Buttons are present by default
  static void initializePreferences(
      Future<SharedPreferences> prefsInstance) async {
    final prefs = await prefsInstance;
    if (prefs.getStringList('buttons') == null) {
      List<String> buttons = ['twoXtwo', 'twoXone','threeXtwo','oneXone'];
      await prefs.setStringList('buttons', buttons);
    }
  }

  // Get Buttons
  static Future<List<String>?> getButtons(getPrefs) async {
    final prefs = await getPrefs;
    final List<String>? buttonsList = prefs.getStringList('buttons');
    print(buttonsList);
    return buttonsList;
  }

  
}
