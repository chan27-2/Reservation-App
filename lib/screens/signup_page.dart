import 'package:flutter/material.dart';
import 'package:resevation_app/constants/constants.dart';
import 'package:resevation_app/services/auth.dart';

class SignPage extends StatefulWidget {
  final Function state;
  SignPage({this.state});
  @override
  _SignPageState createState() => _SignPageState();
}

class _SignPageState extends State<SignPage> {
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
        title: Text('SignUp Page'),
        actions: <Widget>[
          FlatButton.icon(
              onPressed: () {
                widget.state();
              },
              icon: Icon(Icons.person),
              label: Text('Login'))
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
                  validator: (val) => val.length < 6
                      ? 'please enter Password 6+ characters long'
                      : null,
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
                    'SignUp',
                    style: TextStyle(color: Colors.white, fontSize: 18.0),
                  ),
                  onPressed: () async {
                    if (_formkey.currentState.validate()) {
                      dynamic result =
                          await _auth.registerInwithEmail(email, password);

                      if (result == null) {
                        setState(() {
                          error = 'Please supply Valid Email';
                        });
                      }
                    }
                  },
                  color: Colors.blue,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                child: Text(
                  error,
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
