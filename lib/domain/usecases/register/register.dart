import 'package:daur_minyak/domain/entities/result.dart';
import 'package:daur_minyak/domain/entities/user.dart';
import 'package:daur_minyak/domain/repositories/authentication_repository.dart';
import 'package:daur_minyak/domain/repositories/user_repository.dart';
import 'package:daur_minyak/domain/usecases/register/register_params.dart';
import 'package:daur_minyak/domain/usecases/usecase.dart';

class Register implements UseCase<Result<User>, RegisterParams> {
  final AuthenticationRepository _authenticationRepository;
  final UserRepository _userRepository;

  Register(
      {required AuthenticationRepository authenticationRepository,
      required UserRepository userRepository})
      : _authenticationRepository = authenticationRepository,
        _userRepository = userRepository;

  @override
  Future<Result<User>> call(RegisterParams params) async {
    if (params.password != params.passwordConfirmation) {
      return const Result.failed('Password confirmation not match');
    }

    var idResult =
        await _authenticationRepository.register(params.email, params.password);

    if (idResult is Success) {
      var userResult = await _userRepository.createUser(
          uid: idResult.resultValue!,
          email: params.email,
          name: params.name,
          phone: params.phone);

      if (userResult is Success) {
        return Result.success(userResult.resultValue!);
      } else {
        return Result.failed(userResult.resultMessage ?? 'Register failed');
      }
    } else {
      return Result.failed(idResult.resultMessage ?? 'Register failed');
    }
  }
}
