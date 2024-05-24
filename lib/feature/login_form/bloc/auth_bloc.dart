import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthLoginRequested>((event, emit) async {
      emit(AuthLoading());
      final email = event.email;
      final password = event.password;
      //email validation using Regex
      if (password.length < 6) {
        return emit(
            AuthFailure(message: "Password cannot be less than 6 characters!"));
      }
      await Future.delayed(const Duration(seconds: 2), () {
        return emit(AuthSuccess(uid: '$email-$password'));
      });
    });

    on<AuthLogoutRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        await Future.delayed(const Duration(seconds: 2), () {
          return emit(AuthInitial());
        });
      } catch (e) {
        return emit(AuthFailure(message: "Could not log out"));
      }
    });
  }
  @override
  void onChange(Change<AuthState> change) {
    // TODO: implement onChange
    super.onChange(change);
    print('AuthBloc - Change - $change');
  }

  @override
  void onTransition(Transition<AuthEvent, AuthState> transition) {
    // TODO: implement onTransition
    super.onTransition(transition);
    print('Auth Bloc - Transition - $transition');
  }
}
