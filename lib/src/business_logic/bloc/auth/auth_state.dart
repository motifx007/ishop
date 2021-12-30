part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {
  final List<SignUpRequest>? userList;

  AuthInitial({required this.userList});
  @override
  List<Object?> get props => [userList];
}

class LoginSuccess extends AuthState {
  final String token;

  LoginSuccess({required this.token});
  @override
  List<Object?> get props => [token];
}

class SignUpSuccess extends AuthState {
  final List<SignUpRequest>? userList;

  SignUpSuccess({required this.userList});
  @override
  List<Object?> get props => [userList];
}

class LogoutSuccess extends AuthState {}

class Error extends AuthState {
  final String message;

  Error({required this.message});
  @override
  List<Object?> get props => [message];
}
