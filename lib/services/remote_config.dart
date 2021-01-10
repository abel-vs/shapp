import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shapp/services/app_localizations.dart';

import 'package:firebase_remote_config/firebase_remote_config.dart';

const QUESTIONS_NL = "questions_nl";
const QUESTIONS_EN = "questions_en";

class RemoteConfigService {
  final RemoteConfig _remoteConfig;

  final defaults = <String, dynamic>{
    QUESTIONS_NL: {},
    QUESTIONS_EN: {},
  };

  static RemoteConfigService _instance;

  static Future<RemoteConfigService> getInstance() async {
    print("Yeet");
    if (_instance == null) {
      _instance = RemoteConfigService(
        remoteConfig: await RemoteConfig.instance,
      );
    }

    return _instance;
  }

  RemoteConfigService({RemoteConfig remoteConfig}) : _remoteConfig = remoteConfig;

  Map<String, String> questions(BuildContext context) => new Map<String, String>.from(
      json.decode(_remoteConfig.getString(AppLocalizations.of(context).translate("questions_code"))));

  Future initialise() async {
    try {
      await _remoteConfig.setDefaults(defaults);
      await _fetchAndActivate();
    } on FetchThrottledException catch (e) {
      print('Remote config fetch throttled: $e');
    } catch (e) {
      print('Unable to fetch remote config. Cached or default values will be used');
    }
  }

  Future _fetchAndActivate() async {
    await _remoteConfig.fetch();
    await _remoteConfig.activateFetched();
  }
}
