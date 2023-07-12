// import 'dart:html';
import 'package:bloc/bloc.dart';
import 'package:universal_html/html.dart' as html;
import 'package:web_evaluation/constants/app_constants.dart';
import 'package:web_evaluation/repositories/login/login_repo.dart';
import 'package:web_evaluation/repositories/login/login_response.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitialState()) {
    on<LoginReqEvent>((event, emit) async {
      emit(LoginLoadingState());
      final LoginRepo loginRepo = LoginRepo();

      LoginResponseModel response =
          await loginRepo.loginrepo(event.loginRequest);
      if (response.token != null) {
        html.window.localStorage[authToken] = response.token!;

        emit(LoginSuccessfulState());
      } else {
        emit(LoginErrorState(response.errormessage));
      }
    });
  }
}
