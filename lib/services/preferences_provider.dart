import 'package:devicelocale/devicelocale.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shapp/services/app_localizations.dart';

class PreferencesProvider extends ChangeNotifier {

  PreferencesProvider() {
    _loadFromPreferences();
  }

  SharedPreferences _preferences;
  String _themeMode;
  String _language;
  Locale _locale;
  Locale _deviceLocale;

  String get themeMode => _themeMode;

  String get language => _language;

  Locale get locale => _locale;

  set themeMode(String themeMode) {
    print("Setting themeMode to: " + themeMode);
    _themeMode = themeMode;
    _savePreferences();
    notifyListeners();
  }

  set language(String language) {
    print("Setting locale to: " + language);
    _language = language;
    _savePreferences();
    _locale = supportedLocales[language] ?? localeResolution(_deviceLocale, supportedLocales.values);
    notifyListeners();
  }

  _initialPreferences() async {
    if (_preferences == null) _preferences = await SharedPreferences.getInstance();
  }

  _savePreferences() async {
    await _initialPreferences();
    _preferences.setString("theme_mode", _themeMode);
    _preferences.setString("language", _language);
  }

  _loadFromPreferences() async {
    _deviceLocale = await Devicelocale.currentAsLocale;
    await _initialPreferences();
    _themeMode = _preferences.getString("theme_mode") ?? "SYSTEM";
    _language = _preferences.getString("language") ?? "SYSTEM";
    notifyListeners();
  }
}
