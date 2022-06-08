part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class AuthLoading extends LoginState {}

class AuthLoaded extends LoginState {
  final String name;

  AuthLoaded(this.name);
}

class AuthError extends LoginState {}
