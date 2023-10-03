import 'dart:io';

import 'package:daur_minyak/domain/entities/address.dart';
import 'package:daur_minyak/domain/entities/bank.dart';
import 'package:daur_minyak/domain/entities/result.dart';
import 'package:daur_minyak/domain/entities/user.dart';

abstract interface class UserRepository {
  Future<Result<User>> createUser({
    required String uid,
    required String email,
    required String name,
    required String phone,
  });

  Future<Result<User>> getUser({required String uid});
  Future<Result<void>> updateUser({required User user});
  Future<Result<int>> getUserBalance({required String uid});
  Future<Result<User>> updateUserVerification({required String uid});

  Future<Result<User>> updateUserBalance({
    required String uid,
    required int balance,
  });

  Future<Result<User>> uploadUserPicture({
    required User user,
    required File imageFile,
  });

  Future<Result<User>> updateUserPin({
    required String uid,
    required String pin,
  });

  Future<Result<User>> updateUserBank({required Bank bank});

  Future<Result<User>> deleteUserBank({
    required String uid,
    required Bank bank,
  });

  Future<Result<User>> updateUserAddress({
    required Address address,
  });

  Future<Result<User>> deleteUserAddress({
    required String uid,
    required Address address,
  });

  Future<Result<User>> updateUserDefaultAddress({
    required String uid,
    required Address address,
  });
}
