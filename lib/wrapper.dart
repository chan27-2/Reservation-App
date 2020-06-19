import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resevation_app/screens/home_page.dart';

import 'FormPage.dart';
import 'modals/user.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({Key key}) : super(key: key);

  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    if (user == null) {
      return FormPage();
    } else {
      return HomePage();
    }
  }
}
