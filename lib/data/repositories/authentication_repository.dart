import 'package:daur_minyak/domain/entities/result.dart';

abstract interface class AuthenticationRepository {
  Future<Result<String>> login(String email, String password);
  Future<Result<String>> register(String email, String password);
  Future<Result<void>> logout();
  String? getLoggedInUserId();
}
