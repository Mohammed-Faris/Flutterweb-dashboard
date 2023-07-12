part of 'internet_bloc.dart';

abstract class InternetState {}

class InternetInitial extends InternetState {}

class Connected extends InternetState {
  String msg;
  Connected({required this.msg});
}

class Disconnected extends InternetState {
  String msg;
  Disconnected({required this.msg});
}
