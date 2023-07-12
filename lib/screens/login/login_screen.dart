import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:web_evaluation/bloc/bloc/login/login_bloc.dart';
import 'package:web_evaluation/constants/app_constants.dart';
import 'package:web_evaluation/widgets/custom_textfield.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height,
              child: BlocConsumer<LoginBloc, LoginState>(
                listener: (context, state) {
                  if (state is LoginErrorState) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(state.errormessage!)));
                  }
                  if (state is LoginSuccessfulState) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text(loginsuccessful)));

                    context.go('/$watchlist');
                  }
                },
                builder: (context, state) {
                  return Padding(
                      padding: const EdgeInsets.all(eight),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width / three,
                        height: MediaQuery.of(context).size.height / 1.8,
                        child: Form(
                          key: formKey,
                          child: ListView(
                            children: [
                              Container(
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.all(eight),
                                  child: const Text(
                                    login,
                                    style: TextStyle(fontSize: twenty),
                                  )),
                              Container(
                                padding: const EdgeInsets.all(eight),
                                child: AutofillGroup(
                                  child: CustomTextFormField(
                                    validator: (value) {
                                      if ((value != null || value != "") &&
                                          !value!.contains("@")) {
                                        return emailvalidationmessage;
                                      }
                                      return null;
                                    },
                                    autofillHints: const [AutofillHints.email],
                                    textEditingController: emailController,
                                    keyboardtype: email,
                                    labelText: username,
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.fromLTRB(
                                    eight, eight, eight, zero),
                                child: CustomTextFormField(
                                  obstext: true,
                                  textEditingController: passwordController,
                                  labelText: password,
                                  validator: ((value) {
                                    if (value == null || value == "") {
                                      return passwordvalidation;
                                    } else {
                                      return null;
                                    }
                                  }),
                                  keyboardtype: passwordkeyboardtype,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    eight, thirty, eight, eight),
                                child: SizedBox(
                                    height: fifty,
                                    child: ElevatedButton(
                                      child: state is LoginLoadingState
                                          ? const CircularProgressIndicator(
                                              color: Colors.white,
                                            )
                                          : const Text(login),
                                      onPressed: () {
                                        if (formKey.currentState!.validate()) {
                                          BlocProvider.of<LoginBloc>(context)
                                              .add(LoginReqEvent({
                                            "email": emailController.text,
                                            "password": passwordController.text
                                          }));
                                        }
                                      },
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
