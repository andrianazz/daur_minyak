import 'package:daur_minyak/domain/repositories/authentication_repository.dart';
import 'package:daur_minyak/domain/repositories/user_repository.dart';
import 'package:daur_minyak/domain/entities/result.dart';
import 'package:daur_minyak/domain/entities/user.dart';
import 'package:daur_minyak/domain/usecases/usecase.dart';

part 'login_params.dart';

class Login implements UseCase<Result<User>, LoginParams> {
  final AuthenticationRepository authRepository;
  final UserRepository userRepository;

  Login({required this.authRepository, required this.userRepository});

  @override
  Future<Result<User>> call(LoginParams params) async {
    var idResult = await authRepository.login(params.email, params.password);

    if (idResult is Success) {
      var userResult = await userRepository.getUser(uid: idResult.resultValue!);

      if (userResult is Success) {
        return Result.success(userResult.resultValue!);
      } else {
        return Result.failed(userResult.resultMessage!);
      }
    } else {
      return Result.failed(idResult.resultMessage!);
    }
  }
}
