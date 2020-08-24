import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'dependency_injection.dart';
import 'features/login/login_view.dart';
import 'flavor.dart';
import 'provider/user_provider.dart';
import 'router/router.dart';

class App extends StatelessWidget {
  final Flavor _flavor;

  App(this._flavor) {
    setup(_flavor);
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserProvider>.value(
          value: locator<UserProvider>(),
        ),
      ],
      child: MaterialApp(
        title: _flavor.appName,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        onGenerateRoute: Router.generateRoute,
        home: LoginPage(),
      ),
    );
  }
}
