part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class Login extends AuthEvent {
  final LoginRequest loginRequest;

  Login({required this.loginRequest});
  @override
  List<Object?> get props => [loginRequest];
}

class SignUp extends AuthEvent {
  final SignUpRequest signUpRequest;

  SignUp({required this.signUpRequest});
  @override
  List<Object?> get props => [signUpRequest];
}

class Logout extends AuthEvent {}
