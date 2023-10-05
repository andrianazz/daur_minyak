import 'package:daur_minyak/domain/usecases/get_logged_in_user/get_logged_in_user.dart';
import 'package:daur_minyak/presentation/providers/repositories/authentication_repository_provider.dart';
import 'package:daur_minyak/presentation/providers/repositories/user_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_logged_in_user_provider.g.dart';

@riverpod
GetLoggedInUser getLoggedInUser(GetLoggedInUserRef ref) => GetLoggedInUser(
      userRepository: ref.watch(userRepositoryProvider),
      authenticationRepository: ref.watch(authenticationRepositoryProvider),
    );
