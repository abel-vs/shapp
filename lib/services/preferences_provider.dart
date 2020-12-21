import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesProvider extends ChangeNotifier {
  SharedPreferences _preferences;
  String _themeMode;
  String _language;

  String get themeMode => _themeMode;
  String get language => _language;

  PreferencesProvider() {
    _loadFromPreferences();
  }

  _initialPreferences() async {
    if (_preferences == null) _preferences = await SharedPreferences.getInstance();
  }

  _savePreferences() async {
    await _initialPreferences();
    _preferences.setString("theme_mode", _themeMode);
  }

  _loadFromPreferences() async {
    await _initialPreferences();
    _themeMode = _preferences.getString("theme_mode") ?? "SYSTEM";
    _language = _preferences.getString("language") ?? "";
    notifyListeners();
  }

  selectThemeMode(String themeMode) {
    _themeMode = themeMode;
    _savePreferences();
    notifyListeners();
  }
}
