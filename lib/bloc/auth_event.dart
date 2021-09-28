part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class SignIn extends AuthEvent {
  final String email;
  final String password;

  SignIn(this.email, this.password);
}

class CheckSession extends AuthEvent {}

class SignOut extends AuthEvent {}

class SignUp extends AuthEvent {
  final User user;
  final Map<String, String>? file;

  SignUp(this.user, {this.file});
}
