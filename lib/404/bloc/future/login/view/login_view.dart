import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_full_learn/404/bloc/future/login/cubit/login_cubit.dart';
import 'package:kartal/kartal.dart';

import '../cubit/login_cubit_state.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _loginText = 'Login';

  final GlobalKey<FormState> _formLoginKey = GlobalKey();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>(
      create: (context) => LoginCubit(),
      child: Scaffold(
        appBar: AppBar(title: BlocBuilder<LoginCubit, LoginState>(
          builder: (context, state) {
            return state.isLoading ? CircularProgressIndicator(color: context.colorScheme.onPrimary) : const SizedBox();
          },
        )),
        body: Form(
          key: _formLoginKey,
          autovalidateMode: AutovalidateMode.always,
          child: Padding(
            padding: const PagePadding.all(),
            child: Column(
              children: [
                _LoginEmailFields(
                  passwordController: _passwordController,
                  emailcontroller: _emailController,
                ),
                // PasswordTextField(),
                _LoginButton(
                    formLoginKey: _formLoginKey,
                    emailController: _emailController,
                    passwordController: _passwordController,
                    loginText: _loginText)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _LoginButton extends StatelessWidget {
  const _LoginButton({
    Key? key,
    required GlobalKey<FormState> formLoginKey,
    required TextEditingController emailController,
    required TextEditingController passwordController,
    required String loginText,
  })  : _formLoginKey = formLoginKey,
        _emailController = emailController,
        _passwordController = passwordController,
        _loginText = loginText,
        super(key: key);

  final GlobalKey<FormState> _formLoginKey;
  final TextEditingController _emailController;
  final TextEditingController _passwordController;
  final String _loginText;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return ElevatedButton(
            onPressed: () {
              if (_formLoginKey.currentState?.validate() ?? false) {
                context.read<LoginCubit>().checkUser(_emailController.text, _passwordController.text);
              }
            },
            child: Padding(
              padding: const PagePadding.all(),
              child: Text(_loginText),
            ));
      },
    );
  }
}

class _LoginEmailFields extends StatelessWidget {
  const _LoginEmailFields(
      {Key? key, required TextEditingController emailcontroller, required TextEditingController passwordController})
      : _emailController = emailcontroller,
        _passwordController = passwordController,
        super(key: key);

  final TextEditingController _emailController;
  final TextEditingController _passwordController;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<LoginCubit, LoginState, bool>(
      selector: (state) {
        return state.isLoading;
      },
      builder: (context, state) {
        return IgnorePointer(
          ignoring: state,
          child: AnimatedOpacity(
            duration: context.durationLow,
            opacity: state ? 0.3 : 1,
            child: Column(
              children: [
                Padding(
                  padding: const PagePadding.bottom(),
                  child: TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(labelText: 'Email'),
                    validator: (String? data) => (data?.isValidEmail ?? false) ? null : 'Hatalı e mail',
                  ),
                ),
                Padding(
                  padding: const PagePadding.bottom(),
                  child: TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(labelText: 'Password'),
                    validator: (String? data) => (data?.isValidPassword ?? false) ? null : 'Hatalı şifre ',
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class PagePadding extends EdgeInsets {
  const PagePadding.all() : super.all(20);
  const PagePadding.bottom() : super.only(bottom: 10);
}
