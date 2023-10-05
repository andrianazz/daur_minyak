import 'package:daur_minyak/domain/entities/result.dart';
import 'package:daur_minyak/domain/repositories/authentication_repository.dart';

class DummyAuthentication implements AuthenticationRepository {
  @override
  String? getLoggedInUserId() {
    // TODO: implement getLoggedInUserId
    throw UnimplementedError();
  }

  @override
  Future<Result<String>> login(String email, String password) async {
    await Future.delayed(const Duration(seconds: 2), () {});
    return const Result.success("ID-12345");
  }

  @override
  Future<Result<void>> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<Result<String>> register(String email, String password) {
    // TODO: implement register
    throw UnimplementedError();
  }
}
