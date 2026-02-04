// import 'package:firebase_auth/firebase_auth.dart';

// class AuthService {
//   static final _auth = FirebaseAuth.instance;

//   static Future<String?> signUp(String email, String password) async {
//     try {
//       await _auth.createUserWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//       return null; // success
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'email-already-in-use') {
//         return "This email already exists. Please login.";
//       }
//       return e.message;
//     }
//   }

//   static Future<String?> signIn(String email, String password) async {
//     try {
//       await _auth.signInWithEmailAndPassword(email: email, password: password);
//       return null; // success
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'user-not-found') {
//         return "User does not exist. Please sign up.";
//       }
//       if (e.code == 'wrong-password') {
//         return "Incorrect password.";
//       }
//       return e.message;
//     }
//   }
// }

import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  /// 🔐 SIGN UP
  static Future<String?> signUp(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null; // success
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        return 'This email is already registered.';
      }
      return e.message;
    }
  }

  /// 🔐 SIGN IN
  static Future<String?> signIn(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return null; // success
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'No account found for this email.';
      }
      if (e.code == 'wrong-password') {
        return 'Incorrect password.';
      }
      return e.message;
    }
  }

  /// ✅ CHECK IF LOGGED IN
  static Future<bool> isLoggedIn() async {
    return _auth.currentUser != null;
  }

  /// 🚪 LOG OUT
  static Future<void> signOut() async {
    await _auth.signOut();
  }
}
