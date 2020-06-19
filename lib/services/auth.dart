import 'package:firebase_auth/firebase_auth.dart';
import 'package:resevation_app/modals/user.dart';

class AuthInstance {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User _userfromfirebaseuser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_userfromfirebaseuser);
  }

  Future signout() async {
    try {
      return await _auth.signOut();
    } catch (err) {
      print(err.toString());
      return null;
    }
  }

  Future registerInwithEmail(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return user;
    } catch (err) {
      print(err.toString());
      return null;
    }
  }

  Future signinwithEmail(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return user;
    } catch (err) {
      print(err.toString());
      return null;
    }
  }
}
