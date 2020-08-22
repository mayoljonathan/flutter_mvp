import 'package:flutter/material.dart';
import 'dependency_injection.dart';

import 'features/login/login_view.dart';
import 'flavor.dart';
import 'router/router.dart';

class App extends StatelessWidget {
  final Flavor _flavor;

  App(this._flavor) {
    Injector.configure(_flavor);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _flavor.appName,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      onGenerateRoute: Router.generateRoute,
      home: LoginPage(),
    );
  }
}
