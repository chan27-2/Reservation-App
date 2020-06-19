import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  final String did;

  DatabaseService({this.uid, this.did});

  final CollectionReference datacollection =
      Firestore.instance.collection('data');

  Future updateData(
      String username, String number, String email, String dob) async {
    return await datacollection
        .document(uid)
        .collection('data-user')
        .document(did)
        .setData({
      'username': username,
      'mobile.no.': number,
      'email': email,
      'dob': dob
    });
  }

  Future delete() async {
    await Firestore.instance
        .collection('data')
        .document(uid)
        .collection('data-user')
        .document(did)
        .delete()
        .whenComplete(() {})
        .catchError((err) {
      print(err);
    });
  }

  Stream<QuerySnapshot> get data {
    return datacollection.document(uid).collection('data-user').snapshots();
  }

  Stream<DocumentSnapshot> get notesData {
    return datacollection
        .document(uid)
        .collection('data-user')
        .document(did)
        .snapshots();
  }
}
