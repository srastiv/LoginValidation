part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}


class LoginTextOnChangedEvent extends LoginEvent {
  final String email;
  final String password;
  LoginTextOnChangedEvent({required this.email, required this.password});
}