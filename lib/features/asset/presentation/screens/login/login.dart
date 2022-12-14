import 'package:asset/features/asset/presentation/constants/colors.dart';
import 'package:asset/features/asset/presentation/constants/texts.dart';
import 'package:asset/features/asset/presentation/constants/textstyles.dart';
import 'package:asset/features/asset/presentation/screens/login/bloc/login_bloc.dart';
import 'package:asset/features/asset/presentation/screens/report/report.dart';
import 'package:asset/features/asset/presentation/screens/widgets/textfield.dart';
import 'package:asset/features/asset/presentation/screens/widgets/submit_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: kWhite,
          body: SafeArea(
            child: Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 150,
                  ),
                  kLoginToYourAccount,
                  const SizedBox(
                    height: 8,
                  ),
                  kEnterYourDetails,
                  const SizedBox(
                    height: 23,
                  ),
                  kEmailAddress,
                  const SizedBox(
                    height: 6,
                  ),
                  EnterDetailsTextField(
                    text: "Please enter your email address",
                    height: 48,
                    obscuretext: false,
                    controller: emailController,
                    onchange: (value) {
                      BlocProvider.of<LoginBloc>(context).add(
                        LoginTextOnChangedEvent(
                          email: emailController.text,
                          password: passwordController.text,
                        ),
                      );
                    },
                  ),
                  BlocBuilder<LoginBloc, LoginState>(
                    builder: (context, state) {
                      if (state is LoginErrorState) {
                        return Text(
                          state.emailErrorMessage,
                          style: kErrorStyle,
                        );
                      }
                      return const SizedBox();
                    },
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  kPW,
                  const SizedBox(
                    height: 6,
                  ),
                  EnterDetailsTextField(
                    text: "Please enter your password",
                    height: 48,
                    controller: passwordController,
                    obscuretext: true,
                    onchange: (value) {
                      BlocProvider.of<LoginBloc>(context).add(
                        LoginTextOnChangedEvent(
                          password: passwordController.text,
                          email: emailController.text,
                        ),
                      );
                    },
                  ),
                  BlocBuilder<LoginBloc, LoginState>(
                    builder: (context, state) {
                      if (state is LoginErrorState) {
                        return Text(
                          state.passwordErrorMessage,
                          style: kErrorStyle,
                        );
                      }
                      return const SizedBox();
                    },
                  ),
                  const SizedBox(
                    height: 188,
                  ),
                  BlocBuilder<LoginBloc, LoginState>(
                    builder: (context, state) {
                      return SubmitButton(
                          onpressed: () {
                            (state is! LoginValidState)
                                ? null
                                : Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Report(),
                                    ));
                          },
                          color:
                              (state is LoginValidState) ? kBlue : kLightBlue);
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
