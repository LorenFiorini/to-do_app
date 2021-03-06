import 'package:firebase_auth/firebase_auth.dart';


class Auth {
  final FirebaseAuth auth;

  Auth({required this.auth});

  Stream<User?> get user => auth.authStateChanges();

  // 1. Create Account
  Future<String?> createAccount({String? email,String? password}) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email!.trim(),
          password: password!.trim(),
      );
      return "Success";
    } on FirebaseAuthException catch (e) {
      return e.message;
    } catch (e) {
      rethrow;
    }
  }

  // 2. Sign in
  Future<String?> signIn({String? email,String? password}) async {
    try {
      await auth.signInWithEmailAndPassword(
          email: email!.trim(),
          password: password!.trim()
      );
      return "Success";
    } on FirebaseAuthException catch (e) {
      return e.message;
    } catch (e) {
      rethrow;
    }
  }

  // 3. Sign out
  Future<String?> signOut() async {
    try {
      await auth.signOut();
      return "Success";
    } on FirebaseAuthException catch (e) {
      return e.message;
    } catch (e) {
      rethrow;
    }
  }

}
