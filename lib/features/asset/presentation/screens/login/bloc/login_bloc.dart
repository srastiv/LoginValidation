import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitialState()) {
    on<EmailTextOnChangedEvent>((event, emit) {
      if (isEmail(event.email) == false || event.email.isEmpty) {
        emit(EmailErrorState(
            errorMessage: "Please enter a valid email address"));
      } else {
        emit(LoginValidState());
      }
    });

    on<PasswordTextOnChangedEvent>((event, emit) {
      if (validatePassword(event.password) == false || event.password.isEmpty) {
        emit(PasswordErrorState(errorMessage: "Please enter a valid password"));
        if (event.password.length < 8) {
          emit(PasswordErrorState(
              errorMessage: "Password should be atleast 8 characters long"));
        }
        if (!event.password.contains(RegExp(r'[A-Z]'))) {
          emit(PasswordErrorState(
              errorMessage: "Password should contain atleast 1 uppercase"));
        }
         if (!event.password.contains(RegExp(r'[a-z]'))) {
          emit(PasswordErrorState(
              errorMessage: "Password should contain atleast 1 lowercase"));
        }
        if (!event.password.contains(RegExp(r'[0-9]'))) {
          emit(PasswordErrorState(
              errorMessage: "Password should contain atleast 1 digit"));
        }
        if (!event.password.contains(RegExp(r'[!@#\$&*~]'))) {
          emit(PasswordErrorState(
              errorMessage: "Password should contain atleast 1 special character"));
        }

      } else {
        emit(LoginValidState());
      }
    });

    on<SubmitLoginFormEvent>((event, emit) {
      emit(LoginLoadingState());
    });
  }
}
//TODO: DESCRIPTIVE error msgs, regex

bool isEmail(String em) {
  String p =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  RegExp regExp = RegExp(p);

  return regExp.hasMatch(em);
}

bool validatePassword(String value) {
  String pattern =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  RegExp regExp = RegExp(pattern);
  return regExp.hasMatch(value);
}

