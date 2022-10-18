part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class EmailTextOnChangedEvent extends LoginEvent {
  final String email;
  EmailTextOnChangedEvent({required this.email});
}

class PasswordTextOnChangedEvent extends LoginEvent {
  final String password;
  PasswordTextOnChangedEvent({required this.password});
}

class SubmitLoginFormEvent extends LoginEvent {
    final String email;
  final String password;
    SubmitLoginFormEvent({required this.email, required this.password});
}


// class LoginTextOnChangedEvent extends LoginEvent {
//   final String email;
//   final String password;
//   LoginTextOnChangedEvent({required this.email, required this.password});
// }