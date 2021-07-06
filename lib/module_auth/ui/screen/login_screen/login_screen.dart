import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tut/module_auth/bloc/login_bloc/login_bloc.dart';
import 'package:tut/module_auth/ui/states/login_states/login_state.dart';
import 'package:tut/module_auth/ui/states/login_states/login_state_error.dart';
import 'package:tut/module_auth/ui/states/login_states/login_state_init.dart';
import 'package:tut/module_auth/ui/states/login_states/login_state_loading.dart';
import 'package:tut/module_auth/ui/states/login_states/login_state_success.dart';

class LoginScreen extends StatelessWidget {
  final LoginBloC _bloC;
  LoginScreen(this._bloC);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<LoginState>(
      initialData: LoginState(null, EnumLoginState.INIT),
      stream: _bloC.stateStream,
      builder: (context, AsyncSnapshot<LoginState> snapshot) {
        if (snapshot.data.state == EnumLoginState.INIT) {
          return LoginInitState(
            onLoginRequest: (request) {
              _bloC.login(request.email, request.password);
            },
          );
        } else if (snapshot.data.state == EnumLoginState.SUCCESS) {
          return buildLoginStateSuccess(context, snapshot.data.data);
        } else if (snapshot.data.state == EnumLoginState.ERROR) {
          return buildLoginStateError(context, snapshot.data.data);
        } else {
          return buildLoginStateLoading(context);
        }
      },
    ));
  }
}
