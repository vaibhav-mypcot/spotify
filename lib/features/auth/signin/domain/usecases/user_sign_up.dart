import 'package:fpdart/fpdart.dart';
import 'package:spotify/core/error/failures.dart';
import 'package:spotify/core/usecase/usecase.dart';
import 'package:spotify/features/auth/signin/domain/repositories/auth_repository.dart';

class UserSignUp implements UseCase<String, UserSignupParams> {
  final AuthRepository authRepositiry;

  UserSignUp({required this.authRepositiry});

  @override
  Future<Either<Failure, String>> call(UserSignupParams params) async {
    return await authRepositiry.signUpWithEmailPassword(name: params.name, email: params.email, password: params.password);
  }
}

class UserSignupParams {
  final String email;
  final String password;
  final String name;

  UserSignupParams(
      {required this.email, required this.password, required this.name});
}
