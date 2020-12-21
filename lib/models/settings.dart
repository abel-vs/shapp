import 'package:shared_preferences/shared_preferences.dart';

class Settings {
  SharedPreferences prefs;

  Future<void> reload() {
    prefs.reload();
  }
}
