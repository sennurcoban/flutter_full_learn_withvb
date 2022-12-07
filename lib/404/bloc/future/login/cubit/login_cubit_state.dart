// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:flutter_full_learn/404/bloc/future/login/model/login_model.dart';
import 'package:flutter_full_learn/product/model/token_model.dart';

class LoginState extends Equatable {
  final bool isLoading;
  final LoginModel? model;
  final TokenModel? tokenModel;
  final bool isComplete;

  const LoginState({
    this.isLoading = false,
    this.model,
    this.tokenModel,
    this.isComplete = false,
  });
  @override
  List<Object?> get props => [isLoading, model];

  LoginState copyWith({
    bool? isLoading,
    LoginModel? model,
    TokenModel? tokenModel,
    bool? isComplete,
  }) {
    return LoginState(
      isLoading: isLoading ?? false,
      model: model ?? this.model,
      tokenModel: tokenModel ?? this.tokenModel,
      isComplete: isComplete ?? false,
    );
  }
}
