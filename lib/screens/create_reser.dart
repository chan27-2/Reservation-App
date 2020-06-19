import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resevation_app/constants/constants.dart';
import 'package:resevation_app/modals/user.dart';
import 'package:resevation_app/services/database.dart';

class Create extends StatefulWidget {
  Create({Key key}) : super(key: key);

  @override
  _CreateState createState() => _CreateState();
}

class _CreateState extends State<Create> {
  final _formkey = GlobalKey<FormState>();
  String username = '';
  String email = '';
  String number = '';
  String dob = '';
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return StreamProvider<QuerySnapshot>.value(
      value: DatabaseService(uid: user.uid).data,
      child: Scaffold(
        backgroundColor: Colors.lightBlue[50],
        appBar: AppBar(
          title: Center(child: Text('Create New Rreservation')),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Container(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 20.0),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    child: TextFormField(
                      validator: (val) =>
                          val.isEmpty ? 'please enter Username' : null,
                      decoration: textinputdeco('Username:', ''),
                      onChanged: (val) {
                        setState(() {
                          username = val;
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                    child: TextFormField(
                      validator: (val) =>
                          val.isEmpty ? 'please enter mobile number' : null,
                      decoration: textinputdeco('Mobile.no.:', ''),
                      onChanged: (val) {
                        setState(() {
                          number = val;
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                    child: TextFormField(
                      validator: (val) =>
                          val.isEmpty ? 'please enter Email' : null,
                      decoration: textinputdeco('email:', ''),
                      onChanged: (val) {
                        setState(() {
                          email = val;
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                    child: TextFormField(
                      validator: (val) =>
                          val.isEmpty ? 'please enter Date of Birth' : null,
                      decoration: textinputdeco('Date of Birth:', ''),
                      onChanged: (val) {
                        setState(() {
                          dob = val;
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: RaisedButton(
                      child: Text(
                        'Save',
                        style: TextStyle(color: Colors.white, fontSize: 18.0),
                      ),
                      onPressed: () async {
                        if (_formkey.currentState.validate()) {
                          await DatabaseService(uid: user.uid)
                              .updateData(username, number, email, dob);
                          Navigator.pushNamed(context, '/');
                        }
                      },
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
