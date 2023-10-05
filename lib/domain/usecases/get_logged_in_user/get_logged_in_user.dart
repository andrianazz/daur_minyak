import 'package:daur_minyak/domain/entities/result.dart';
import 'package:daur_minyak/domain/entities/user.dart';
import 'package:daur_minyak/domain/repositories/authentication_repository.dart';
import 'package:daur_minyak/domain/repositories/user_repository.dart';
import 'package:daur_minyak/domain/usecases/usecase.dart';

class GetLoggedInUser implements UseCase<Result<User>, void> {
  final UserRepository _userRepository;
  final AuthenticationRepository _authenticationRepository;

  GetLoggedInUser(
      {required UserRepository userRepository,
      required AuthenticationRepository authenticationRepository})
      : _userRepository = userRepository,
        _authenticationRepository = authenticationRepository;

  @override
  Future<Result<User>> call(void params) async {
    String? loggedID = _authenticationRepository.getLoggedInUserId();

    if (loggedID != null) {
      var userResult = await _userRepository.getUser(uid: loggedID);

      if (userResult.isSuccess) {
        return Result.success(userResult.resultValue!);
      } else {
        return Result.failed(userResult.resultMessage!);
      }
    } else {
      return const Result.failed("No user logged in");
    }
  }
}
