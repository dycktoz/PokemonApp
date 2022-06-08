import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginEvent>((event, emit) async {
      if (event is LoginSubmited) {
        if (event.name.isEmpty || event.passwd.isEmpty) {
          emit(AuthError());
        } else {
          emit(AuthLoading());
          await Future.delayed(const Duration(seconds: 3), () {
            emit(AuthLoaded(event.name));
          });
        }
      }
      // TODO: implement event handler
      print('Activated User Called');
    });
  }
}

// class Blokc implements BaseBloc {
//   final _emailController = StreamController<String>();
//   final _passwordController = StreamController<String>();

//   @override
//   void dispose() {
//     _emailController.close();
//     _passwordController.close();
//     // TODO: implement dispose
//   }
// }

// abstract class BaseBloc {
//   void dispose();
// }
