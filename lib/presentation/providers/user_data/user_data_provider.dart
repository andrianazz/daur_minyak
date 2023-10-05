import 'package:daur_minyak/domain/entities/result.dart';
import 'package:daur_minyak/domain/entities/user.dart';
import 'package:daur_minyak/domain/usecases/get_logged_in_user/get_logged_in_user.dart';
import 'package:daur_minyak/domain/usecases/login/login.dart';
import 'package:daur_minyak/domain/usecases/logout/logout.dart';
import 'package:daur_minyak/presentation/providers/usecases/get_logged_in_user_provider.dart';
import 'package:daur_minyak/presentation/providers/usecases/login_provider.dart';
import 'package:daur_minyak/presentation/providers/usecases/logout_provider.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_data_provider.g.dart';

@Riverpod(keepAlive: true)
class UserData extends _$UserData {
  @override
  Future<User?> build() async {
    GetLoggedInUser getLoggedInUser = ref.read(getLoggedInUserProvider);
    var result = await getLoggedInUser(null);

    switch (result) {
      case Success(value: final user):
        return user;

      case Failed(message: _):
        return null;
    }
  }

  Future<void> login({required String email, required String password}) async {
    state = const AsyncLoading();

    Login login = ref.read(loginProvider);

    var result = await login(LoginParams(email: email, password: password));

    switch (result) {
      case Success(value: final user):
        state = AsyncData(user);

      case Failed(message: final message):
        state = AsyncError(FlutterError(message), StackTrace.current);
        state = const AsyncData(null);
    }
  }

  Future<void> logout() async {
    state = const AsyncLoading();

    Logout logout = ref.read(logoutProvider);

    var result = await logout(null);

    switch (result) {
      case Success(value: final user):
        state = const AsyncData(null);

      case Failed(message: final message):
        state = AsyncError(FlutterError(message), StackTrace.current);
        state = AsyncData(state.valueOrNull);
    }
  }
}
