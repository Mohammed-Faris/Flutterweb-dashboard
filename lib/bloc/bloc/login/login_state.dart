part of 'login_bloc.dart';

abstract class LoginState {
  const LoginState();
}

class LoginInitialState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessfulState extends LoginState {}

class LoginErrorState extends LoginState {
  final dynamic errormessage;

  const LoginErrorState(this.errormessage);
}
