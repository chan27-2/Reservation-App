import 'package:flutter/material.dart';
import 'package:resevation_app/screens/login_Page.dart';
import 'package:resevation_app/screens/signup_page.dart';

class FormPage extends StatefulWidget {
  const FormPage({Key key}) : super(key: key);

  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  bool showsignin = true;

  void toggleloginPage() {
    setState(() {
      showsignin = !showsignin;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showsignin) {
      return LoginPage(state: toggleloginPage);
    } else {
      return SignPage(state: toggleloginPage);
    }
  }
}
