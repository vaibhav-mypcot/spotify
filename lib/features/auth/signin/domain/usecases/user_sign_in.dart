import 'package:fpdart/fpdart.dart';
import 'package:spotify/core/error/failures.dart';
import 'package:spotify/core/usecase/usecase.dart';
import 'package:spotify/features/auth/signin/domain/repositories/auth_repository.dart';

class UserSignIn implements UseCase<String, UserSignInParams> {
  final AuthRepository authRepositiry;

  UserSignIn({required this.authRepositiry});

  @override
  Future<Either<Failure, String>> call(UserSignInParams params) async {
    return await authRepositiry.signInWithEmailPassword(
        email: params.email, password: params.password);
  }
}

class UserSignInParams {
  final String email;
  final String password;

  UserSignInParams({required this.email, required this.password});
}
