import 'package:daur_minyak/data/repositories/firebase/firebase_authentication.dart';
import 'package:daur_minyak/domain/repositories/authentication_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'authentication_repository_provider.g.dart';

@riverpod
AuthenticationRepository authenticationRepository(
        AuthenticationRepositoryRef ref) =>
    FirebaseAuthentication();
