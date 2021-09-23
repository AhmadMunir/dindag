part of 'auth_bloc.dart';

@immutable
abstract class AuthState {
  final User user;

  AuthState(this.user);
}

class AuthInitial extends AuthState {
  final String? message;
  AuthInitial({this.message}) : super(UnauthenticatedUser());
}

class AuthLoggedIn extends AuthState {
  AuthLoggedIn(User user) : super(user);
}

