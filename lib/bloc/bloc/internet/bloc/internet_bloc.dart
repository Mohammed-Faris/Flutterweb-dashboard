import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'internet_event.dart';
part 'internet_state.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  StreamSubscription? subscription;
  InternetBloc() : super(InternetInitial()) {
    on<OnConnected>((event, emit) {
      emit(Connected(msg: 'Connected...'));
    });
    on<OnDisconnected>((event, emit) {
      emit(Disconnected(msg: 'No Internet'));
    });
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (result == ConnectivityResult.wifi ||
          result == ConnectivityResult.mobile) {
        add(OnConnected());
      } else {
        add(OnDisconnected());
      }
    });
  }
  @override
  Future<void> close() {
    subscription?.cancel();
    return super.close();
  }
}
