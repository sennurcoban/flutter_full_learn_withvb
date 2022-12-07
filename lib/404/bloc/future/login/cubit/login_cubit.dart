import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_full_learn/404/bloc/future/login/model/login_model.dart';
import 'package:flutter_full_learn/404/bloc/future/login/service/login_service.dart';

import 'login_cubit_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(ILoginService loginService)
      : _loginService = loginService,
        super(const LoginState());
  final ILoginService _loginService;

  Future<void> checkUser(String email, String password) async {
    emit(state.copyWith(isLoading: true, model: LoginModel(email, password)));
    final response = await _loginService.login(state.model!);
    emit(state.copyWith(isLoading: false, isComplete: response?.data != null));
  }
}
