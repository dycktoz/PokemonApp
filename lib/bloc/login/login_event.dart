part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

// class LoginUsernameChanged extends LoginEvent {
//   final String username;

//   LoginUsernameChanged({required this.username});
// }

// class LoginPasswordChanged extends LoginEvent {
//   final String password;

//   LoginPasswordChanged(this.password);
// }

class LoginSubmited extends LoginEvent {
  final String name;
  final String passwd;

  LoginSubmited(this.name, this.passwd);
}
