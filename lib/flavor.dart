import 'package:flutter/material.dart';

enum Environment { DEV, PROD }

class Flavor {
  final String appName;
  final Environment environment;
  final String baseApiUrl;

  static Flavor _instance;

  factory Flavor({
    @required String appName,
    @required Environment environment,
    @required String baseApiUrl,
  }) {
    _instance = Flavor._internal(appName, environment, baseApiUrl);
    return _instance;
  }

  Flavor._internal(this.appName, this.environment, this.baseApiUrl);
}
