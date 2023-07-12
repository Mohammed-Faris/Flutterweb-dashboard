part of 'login_bloc.dart';

abstract class LoginEvent {}

class LoginInitialEvent extends LoginEvent {}

class LoginReqEvent extends LoginEvent {
  final dynamic loginRequest;
  LoginReqEvent(this.loginRequest);
}
