import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resevation_app/routes.dart';
import 'package:resevation_app/services/auth.dart';

import 'modals/user.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
        value: AuthInstance().user,
        builder: (context, snapshot) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: '/wrapper',
            onGenerateRoute: RouteGenerator.generateRoute,
          );
        });
  }
}
