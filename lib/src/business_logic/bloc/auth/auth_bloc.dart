import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:ishop/src/business_logic/model/login_request.dart';
import 'package:ishop/src/business_logic/model/sign_up_request.dart';

part 'auth_event.dart';
part 'auth_state.dart';

List<SignUpRequest>? _usersList = [];

class AuthBloc extends HydratedBloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial(userList: [])) {
    on<Login>((event, emit) {
      bool _isUserPresent = false;
      String _userToken = '';
      for (SignUpRequest user in _usersList!) {
        if (user.email == event.loginRequest.email && user.password == event.loginRequest.password) {
          // emit(LoginSuccess());
          _userToken = user.token!;
          _isUserPresent = true;
          break;
        }
      }
      if (_isUserPresent) {
        emit(LoginSuccess(token: _userToken));
      } else {
        emit(Error(message: 'Login failed!'));
      }
    });

    on<SignUp>((event, emit) {
      _usersList!.add(event.signUpRequest);
      emit(SignUpSuccess(userList: _usersList));
    });

    on<Logout>((event, emit) {});
  }

  @override
  AuthState? fromJson(Map<String, dynamic> json) {
    List<SignUpRequest>? _users;
    if (json['users'] != null) {
      _users = <SignUpRequest>[];
      json['users'].forEach((v) {
        _users?.add(SignUpRequest.fromJson(v));
      });
    }
    _usersList = _users;
    return AuthInitial(userList: _users);
  }

  @override
  Map<String, dynamic>? toJson(AuthState state) {
    // if (state is AuthInitial) {
    // return {"users": state.products?.map((v) => v.toJson()).toList()};
    // }
    if (state is SignUpSuccess) {
      return {"users": state.userList?.map((v) => v.toJson()).toList()};
    }
  }
}
