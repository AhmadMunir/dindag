import 'package:bloc/bloc.dart';
import 'package:dindag/models/models.dart';
import 'package:dindag/services/auth_service.dart';
import 'package:dindag/tools/current_response.dart';
import 'package:meta/meta.dart';

import 'package:http/http.dart' as http;

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<SignIn>((event, emit) async {
      // print(event.email);
      final CurrentResponse<User> cuser = await AuthService(http.Client()).signin(event.email, event.password);
      emit(cuser.status! ? AuthLoggedIn(cuser.data!) : AuthInitial(message: cuser.message));
    });

    on<CheckSession>((event, emit) async {
      final CurrentResponse<User> cuser = await AuthService(http.Client()).account();
      emit(cuser.status! ? AuthLoggedIn(cuser.data!) : AuthInitial(message: ''));
    });
  }
}
