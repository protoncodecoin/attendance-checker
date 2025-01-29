import 'package:firebase_auth/firebase_auth.dart';
import 'package:attendance_system/db/db_helper.dart';

class AuthService {
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static final User? currentUser = _auth.currentUser;

  static Future<bool> loginAdmin(String email, String password) async {
    final credentials = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    // return credentials.user != null;
    return DbHelper.isAdmin(credentials.user!.uid);
  }

  static Future<void> logout() {
    return _auth.signOut();
  }
}
