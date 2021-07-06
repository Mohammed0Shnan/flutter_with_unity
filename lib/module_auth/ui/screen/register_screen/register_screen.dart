import 'package:flutter/material.dart';
import 'package:tut/module_auth/authorization_routes.dart';
import 'package:tut/module_auth/bloc/register_bloc/register_bloc.dart';
import 'package:tut/module_auth/model/app_user.dart';
import 'package:tut/module_auth/ui/states/login_states/login_state_error.dart';
import 'package:tut/module_auth/ui/states/login_states/login_state_loading.dart';
import 'package:tut/module_auth/ui/states/register_states/register_state.dart';
import 'package:tut/module_auth/ui/states/register_states/register_state_init.dart';
import 'package:tut/module_auth/ui/states/register_states/register_state_success.dart';

class RegisterScreen extends StatelessWidget {
  final RegisterBloC _bloC;
  RegisterScreen(this._bloC);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<RegisterState>(
      initialData: RegisterState(data: null, state: EnumRegisterState.INIT),
      stream: _bloC.stateStream,
      builder: (context, AsyncSnapshot<RegisterState> snapshot) {
        if (snapshot.data.state == EnumRegisterState.INIT) {
          return RegisterInitState(
            user: snapshot.data.data == null
                ? null
                : snapshot.data.data['user'].cast<AppUser>(),
            onSignUpRequest: (AppUser user) {
              _bloC.registerUser(user);
            },
          );
        }
        if (snapshot.data.state == EnumRegisterState.SUCCESS) {
          return IsertedCondeState(
            code: snapshot.data.data == null
                ? null
                : snapshot.data.data['code'].toString(),
            onConfirmRequest: (code) {
              _bloC.confirmCode(code);
            },
          );
        } else if (snapshot.data.state == EnumRegisterState.ERROR) {
          return buildLoginStateError(context, snapshot.data.data);
        } else if (snapshot.data.state == EnumRegisterState.CONFIRMD) {
          return Center(
            child: GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .pushNamed(AuthorizationRoutes.LOGIN_SCREEN);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.brown.shade400,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(
                    'Code Confirmed',
                    style: TextStyle(color: Colors.white),
                  ),
                )),
          );
        } else {
          return buildLoginStateLoading(context);
        }
      },
    ));
  }

  void registerUser(String email, String username, String password) {
    // _bloC.registerUser(email, username, password, this);
  }
}
