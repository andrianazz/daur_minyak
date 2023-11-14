import 'package:daur_minyak/domain/entities/result.dart';
import 'package:daur_minyak/domain/repositories/authentication_repository.dart';

import 'package:firebase_auth/firebase_auth.dart' as fireAuth;
import 'package:firebase_core/firebase_core.dart';

class FirebaseAuthentication implements AuthenticationRepository {
  final fireAuth.FirebaseAuth _firebaseAuth;

  FirebaseAuthentication({fireAuth.FirebaseAuth? firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? fireAuth.FirebaseAuth.instance;
  @override
  String? getLoggedInUserId() => _firebaseAuth.currentUser?.uid;

  @override
  Future<Result<String>> login(String email, String password) async {
    try {
      var userCredential = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);

      if (userCredential.user != null) {
        return Result.success(userCredential.user!.uid);
      } else {
        return const Result.failed('Login failed');
      }
    } on FirebaseException catch (e) {
      return Result.failed(e.message ?? 'Login failed');
    }
  }

  @override
  Future<Result<void>> logout() async {
    try {
      await _firebaseAuth.signOut();

      if (_firebaseAuth.currentUser == null) {
        return const Result.success(null);
      } else {
        return const Result.failed('Logout failed');
      }
    } on FirebaseException catch (e) {
      return Result.failed(e.message ?? 'Logout failed');
    }
  }

  @override
  Future<Result<String>> register(String email, String password) async {
    try {
      var userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);

      if (userCredential != null) {
        return Result.success(userCredential.user!.uid);
      } else {
        return const Result.failed('Register failed');
      }
    } on FirebaseException catch (e) {
      return Result.failed(e.message ?? 'Register failed');
    }
  }
}
