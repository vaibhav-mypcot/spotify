import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/features/auth/signin/domain/usecases/user_sign_in.dart';
import 'package:spotify/features/auth/signin/domain/usecases/user_sign_up.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignUp _userSignUp;
  final UserSignIn _userSignIn;

  AuthBloc({required UserSignUp userSignUp, required UserSignIn userSignIn})
      : _userSignUp = userSignUp,
        _userSignIn = userSignIn,
        super(AuthInitial()) {
    on<AuthSignupEvent>(authSignup);
    on<AuthSigninEvent>(authSignin);
  }

  authSignup(AuthSignupEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    final response = await _userSignUp(
      UserSignupParams(
        email: event.email,
        password: event.password,
        name: event.name,
      ),
    );

    response.fold(
      (failure) => emit(AuthFailureState(failure.messaage)),
      (uid) => emit(AuthSuccessState(uid)),
    );
  }

  authSignin(AuthSigninEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    final response = await _userSignIn(
      UserSignInParams(
        email: event.email,
        password: event.password,
      ),
    );

    response.fold(
      (failure) => emit(AuthFailureState(failure.messaage)),
      (uid) => emit(AuthSuccessState(uid)),
    );
  }
}
