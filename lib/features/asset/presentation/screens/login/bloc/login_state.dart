part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class LoginInitialState extends LoginState {}

class LoginValidState extends LoginState {}

class LoginErrorState extends LoginState {
  final String emailErrorMessage;
  final String passwordErrorMessage;
  LoginErrorState(
      {required this.passwordErrorMessage, required this.emailErrorMessage});
}
