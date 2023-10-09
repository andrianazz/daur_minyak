import 'package:daur_minyak/domain/usecases/register/register.dart';
import 'package:daur_minyak/presentation/providers/repositories/authentication_repository_provider.dart';
import 'package:daur_minyak/presentation/providers/repositories/user_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'register_provider.g.dart';

@riverpod
Register register(RegisterRef ref) => Register(
      authenticationRepository: ref.watch(authenticationRepositoryProvider),
      userRepository: ref.watch(userRepositoryProvider),
    );
