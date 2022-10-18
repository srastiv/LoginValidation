part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class LoginInitialState extends LoginState {}

class LoginValidState extends LoginState {}

class LoginLoadingState extends LoginState {}

class EmailErrorState extends LoginState {
  final String errorMessage;
  EmailErrorState({required this.errorMessage});
}

class PasswordErrorState extends LoginState {
  final String errorMessage;
  PasswordErrorState({required this.errorMessage});
}