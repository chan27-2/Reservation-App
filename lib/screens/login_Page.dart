import 'package:flutter/material.dart';
import 'package:resevation_app/constants/constants.dart';
import 'package:resevation_app/services/auth.dart';

class LoginPage extends StatefulWidget {
  final Function state;
  LoginPage({this.state});
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthInstance _auth = AuthInstance();
  final _formkey = GlobalKey<FormState>();
  String email = '';
  String error = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      appBar: AppBar(
        title: Text('Login Page'),
        actions: <Widget>[
          FlatButton.icon(
              onPressed: () {
                widget.state();
              },
              icon: Icon(Icons.person),
              label: Text('SignUp'))
        ],
      ),
      body: Form(
        key: _formkey,
        child: Container(
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                child: TextFormField(
                  validator: (val) => val.isEmpty ? 'please enter Email' : null,
                  decoration: textinputdeco('email:', 'abc@gmail.com'),
                  onChanged: (val) {
                    setState(() {
                      email = val;
                    });
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: TextFormField(
                  validator: (val) =>
                      val.isEmpty ? 'please enter Password' : null,
                  decoration: textinputdeco('password:', ''),
                  onChanged: (val) {
                    setState(() {
                      password = val;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: RaisedButton(
                  child: Text(
                    'LogIn',
                    style: TextStyle(color: Colors.white, fontSize: 18.0),
                  ),
                  onPressed: () async {
                    if (_formkey.currentState.validate()) {
                      dynamic result =
                          await _auth.signinwithEmail(email, password);

                      if (result == null) {
                        setState(() {
                          error = 'Could not Sign In';
                        });
                      }
                    }
                  },
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
