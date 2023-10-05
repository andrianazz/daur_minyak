import 'package:daur_minyak/domain/usecases/logout/logout.dart';
import 'package:daur_minyak/presentation/providers/repositories/authentication_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'logout_provider.g.dart';

@riverpod
Logout logout(LogoutRef ref) =>
    Logout(authRepository: ref.watch(authenticationRepositoryProvider));
