part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

final class AuthSignupEvent extends AuthEvent {
  final String email;
  final String password;
  final String name;

  AuthSignupEvent({
    required this.email,
    required this.password,
    required this.name,
  });
}


final class AuthSigninEvent extends AuthEvent {
  final String email;
  final String password;


  AuthSigninEvent({
    required this.email,
    required this.password,
   
  });
}

