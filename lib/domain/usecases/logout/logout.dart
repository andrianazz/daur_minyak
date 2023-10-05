import 'package:daur_minyak/domain/entities/result.dart';
import 'package:daur_minyak/domain/repositories/authentication_repository.dart';
import 'package:daur_minyak/domain/usecases/usecase.dart';

class Logout implements UseCase<Result<void>, void> {
  final AuthenticationRepository _authRepository;

  Logout({required AuthenticationRepository authRepository})
      : _authRepository = authRepository;

  @override
  Future<Result<void>> call(void params) {
    return _authRepository.logout();
  }
}
