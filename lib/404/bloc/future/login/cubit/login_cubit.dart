import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_full_learn/404/bloc/future/login/model/login_model.dart';

import 'login_cubit_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState());

  Future<void> checkUser(String email, String password) async {
    emit(state.copyWith(isLoading: true, model: LoginModel(email, password)));
    await Future.delayed(const Duration(seconds: 1));
    emit(state.copyWith(isLoading: false));
  }
}
