// import 'package:fpdart/fpdart.dart';
// import 'package:spotify/core/error/failures.dart';
// import 'package:spotify/core/usecase/usecase.dart';
// import 'package:spotify/features/auth/signin/domain/entities/user.dart';
// import 'package:spotify/features/auth/signin/domain/repositories/auth_repository.dart';

// class CurrentUser implements UseCase<User, NoParams> {
//   final AuthRepository authRepository;
//   CurrentUser(this.authRepository);
//   @override
//   Future<Either<Failure, User>> call(NoParams params) async {
//     return await authRepository.currentUser();
//   }
// }