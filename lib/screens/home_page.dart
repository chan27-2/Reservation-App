import 'package:flutter/material.dart';
import 'package:resevation_app/services/auth.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthInstance _auth = AuthInstance();

    return Scaffold(
        appBar: AppBar(
          title: Text('Reservation app'),
          actions: <Widget>[
            FlatButton.icon(
                onPressed: () async => _auth.signout(),
                icon: Icon(Icons.person),
                label: Text('logout')),
          ],
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 200.0, bottom: 8.0),
                  child: RaisedButton(
                    child: Text(
                      'Create New Reservation',
                      style: TextStyle(color: Colors.white, fontSize: 18.0),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/create_reser');
                    },
                    color: Colors.blue,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                    child: Text(
                      'Read and Edit Reservations',
                      style: TextStyle(color: Colors.white, fontSize: 18.0),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/reserlist');
                    },
                    color: Colors.blue,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                    child: Text(
                      'Delete Reservation',
                      style: TextStyle(color: Colors.white, fontSize: 18.0),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/del');
                    },
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
