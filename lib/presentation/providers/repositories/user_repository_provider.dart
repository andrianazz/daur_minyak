import 'package:daur_minyak/data/repositories/firebase/firebase_user_repository.dart';
import 'package:daur_minyak/domain/repositories/user_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_repository_provider.g.dart';

@riverpod
UserRepository userRepository(UserRepositoryRef ref) =>
    FirebaseUserRepository();
