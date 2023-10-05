import 'package:daur_minyak/domain/usecases/login/login.dart';
import 'package:daur_minyak/presentation/providers/repositories/authentication_repository_provider.dart';
import 'package:daur_minyak/presentation/providers/repositories/user_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_provider.g.dart';

@riverpod
Login login(LoginRef ref) => Login(
      authRepository: ref.watch(authenticationRepositoryProvider),
      userRepository: ref.watch(userRepositoryProvider),
    );
