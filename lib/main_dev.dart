import 'package:flutter/material.dart';
import 'flavor.dart';

import 'app.dart';

void main() {
  final Flavor flavor = Flavor(
    appName: 'Flutter MVP - Dev',
    environment: Environment.DEV,
    baseApiUrl: 'http://192.168.254.102:3000',
  );

  runApp(App(flavor));
}
