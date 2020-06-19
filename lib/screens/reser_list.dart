import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resevation_app/modals/user.dart';
import 'package:resevation_app/services/auth.dart';

String id;

class ReserList extends StatefulWidget {
  ReserList({Key key}) : super(key: key);

  @override
  _ReserListState createState() => _ReserListState();
}

class _ReserListState extends State<ReserList> {
  @override
  Widget build(BuildContext context) {
    final AuthInstance _auth = AuthInstance();
    final user = Provider.of<User>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Reservations'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance
            .collection('data')
            .document(user.uid)
            .collection('data-user')
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) return new Text('Error: ${snapshot.error}');
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(
                child: Text(
                  'Loading...',
                  style: TextStyle(fontSize: 30),
                ),
              );
            default:
              return ListView(
                children:
                    snapshot.data.documents.map((DocumentSnapshot document) {
                  return GestureDetector(
                    child: Card(
                      child: Column(
                        children: <Widget>[
                          Text(
                            document['username'],
                            textAlign: TextAlign.left,
                          ),
                          Text(document['email']),
                          Text(document['mobile.no.']),
                          Text(document['dob']),
                          Text('EDIT')
                        ],
                      ),
                    ),
                    onTap: () {
                      id = document.documentID;
                      Navigator.of(context).pushNamed(
                        '/edit_reser',
                        arguments: id,
                      );
                    },
                  );
                }).toList(),
              );
          }
        },
      ),
    );
  }
}
