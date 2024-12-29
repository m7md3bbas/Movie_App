// ignore_for_file: constant_pattern_never_matches_value_type, duplicate_ignore

import 'package:firebase_auth/firebase_auth.dart';
import 'package:movieapp/features/auth/data/models/user.dart';
import 'package:movieapp/features/auth/domain/entities/userentity.dart';
import 'package:movieapp/features/auth/domain/repo/repo.dart';

class FirebaseAuthDataSource implements AuthRepository {
  final FirebaseAuth _firebaseAuth;

  FirebaseAuthDataSource(this._firebaseAuth);

  @override
  Stream<UserEntity?> get authStateChange {
    return _firebaseAuth.authStateChanges().map((user) {
      return user != null ? UserModel.fromFireBase(user) : null;
    });
  }

  @override
  Future<UserEntity> login(
      {required String email, required String password}) async {
    try {
      var user = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return UserModel.fromFireBase(user.user!);
    } catch (e) {
      throw "Error logging in: $e";
    }
  }

  @override
  Future<UserEntity> signup(
      {required String email, required String password}) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (userCredential.user == null) {
        throw Exception("sgin up filed");
      }
      return UserModel.fromFireBase(userCredential.user!);
    } on FirebaseAuthException catch (e) {
      throw _handlefirebaseAuthEr(e);
    }
  }

  @override
  Future<void> logout() async {
    await _firebaseAuth.signOut();
  }

  @override
  Future<void> resetPassword({required String email}) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw _handlefirebaseAuthEr(e);
    }
  }

  Exception _handlefirebaseAuthEr(FirebaseAuthException errorCode) {
    switch (errorCode) {
      // ignore: constant_pattern_never_matches_value_type
      case 'user-not-found':
        return Exception('No user found with this email.');
      case 'wrong-password':
        return Exception('Incorrect password.');
      case 'email-already-in-use':
        return Exception('Email is already in use.');
      case 'weak-password':
        return Exception('Password is too weak.');
      default:
        return Exception(errorCode.message ?? "Authentication failed");
    }
  }
}
