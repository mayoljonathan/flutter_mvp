import 'package:flutter/material.dart';
import 'flavor.dart';

import 'app.dart';

void main() {
  final Flavor flavor = Flavor(
    appName: 'Flutter MVP',
    environment: Environment.PROD,
    baseApiUrl: 'https://express-mongoose-crud-api.herokuapp.com',
  );

  runApp(App(flavor));
}
