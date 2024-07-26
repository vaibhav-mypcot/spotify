import 'package:spotify/core/error/failures.dart';
import 'package:fpdart/fpdart.dart';
import 'package:spotify/features/auth/signin/domain/entities/user.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, String>> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  });

  Future<Either<Failure, String>> signInWithEmailPassword({
    required String email,
    required String password,
  });

  // Future<Either<Failure, User>> currentUser();
}
