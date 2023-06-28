import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  AuthRepository()
      : _firebaseAuth = FirebaseAuth.instance;

  final FirebaseAuth _firebaseAuth;

  Stream<User?> get user => _firebaseAuth.authStateChanges();

  Future<User?> signUp({
    required String email,
    required String password
  }) async {
    try {
      final result = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      return result.user;
    } on FirebaseAuthException catch (e) {
      throw Exception(e);
    } catch (_) {
      throw Exception();
    }
  }

  Future<User?> logInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final result = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return result.user;
    } on FirebaseAuthException catch (e) {
      throw Exception(e);
    } catch (_) {
      throw Exception();
    }
  }

  Future<void> logout() async {
    try {
      await _firebaseAuth.signOut();
    } on FirebaseAuthException catch (e) {
      throw Exception(e);
    } catch (_) {
      throw Exception();
    }
  }
}