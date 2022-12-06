// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:flutter_full_learn/404/bloc/future/login/model/login_model.dart';

class LoginState extends Equatable {
  final bool isLoading;
  final LoginModel? model;

  const LoginState({
    this.isLoading = false,
    this.model,
  });
  @override
  List<Object?> get props => [isLoading, model];

  LoginState copyWith({
    bool? isLoading,
    LoginModel? model,
  }) {
    return LoginState(
      isLoading: isLoading ?? this.isLoading,
      model: model ?? this.model,
    );
  }
}
