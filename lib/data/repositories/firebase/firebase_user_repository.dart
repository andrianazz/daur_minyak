import 'dart:io';

import 'package:daur_minyak/domain/entities/address.dart';
import 'package:daur_minyak/domain/entities/bank.dart';
import 'package:daur_minyak/domain/entities/result.dart';
import 'package:daur_minyak/domain/entities/user.dart';
import 'package:daur_minyak/domain/repositories/user_repository.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseUserRepository implements UserRepository {
  final FirebaseFirestore _firebaseFirestore;

  FirebaseUserRepository({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Future<Result<User>> createUser(
      {required String uid,
      required String email,
      required String name,
      required String phone}) {
    // TODO: implement createUser
    throw UnimplementedError();
  }

  @override
  Future<Result<User>> deleteUserAddress(
      {required String uid, required Address address}) {
    // TODO: implement deleteUserAddress
    throw UnimplementedError();
  }

  @override
  Future<Result<User>> deleteUserBank(
      {required String uid, required Bank bank}) {
    // TODO: implement deleteUserBank
    throw UnimplementedError();
  }

  @override
  Future<Result<User>> getUser({required String uid}) async {
    try {
      DocumentReference<Map<String, dynamic>> documentReference =
          _firebaseFirestore.doc('users/$uid');

      DocumentSnapshot<Map<String, dynamic>> result =
          await documentReference.get();

      if (result.exists) {
        return Result.success(User.fromJson(result.data()!));
      } else {
        return const Result.failed('User not found');
      }
    } on FirebaseException catch (e) {
      return Result.failed(e.message ?? 'Get user failed');
    }
  }

  @override
  Future<Result<int>> getUserBalance({required String uid}) {
    // TODO: implement getUserBalance
    throw UnimplementedError();
  }

  @override
  Future<Result<void>> updateUser({required User user}) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }

  @override
  Future<Result<User>> updateUserAddress({required Address address}) {
    // TODO: implement updateUserAddress
    throw UnimplementedError();
  }

  @override
  Future<Result<User>> updateUserBalance(
      {required String uid, required int balance}) {
    // TODO: implement updateUserBalance
    throw UnimplementedError();
  }

  @override
  Future<Result<User>> updateUserBank({required Bank bank}) {
    // TODO: implement updateUserBank
    throw UnimplementedError();
  }

  @override
  Future<Result<User>> updateUserDefaultAddress(
      {required String uid, required Address address}) {
    // TODO: implement updateUserDefaultAddress
    throw UnimplementedError();
  }

  @override
  Future<Result<User>> updateUserPin(
      {required String uid, required String pin}) {
    // TODO: implement updateUserPin
    throw UnimplementedError();
  }

  @override
  Future<Result<User>> updateUserVerification({required String uid}) {
    // TODO: implement updateUserVerification
    throw UnimplementedError();
  }

  @override
  Future<Result<User>> uploadUserPicture(
      {required User user, required File imageFile}) {
    // TODO: implement uploadUserPicture
    throw UnimplementedError();
  }
}
