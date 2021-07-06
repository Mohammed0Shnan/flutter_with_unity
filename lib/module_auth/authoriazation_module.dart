import 'package:flutter/cupertino.dart';
import 'package:tut/abstracts/module/my_module.dart';
import 'package:tut/module_auth/ui/screen/login_screen/login_screen.dart';
import 'package:tut/module_auth/ui/screen/register_screen/register_screen.dart';
import 'authorization_routes.dart';

class AuthorizationModule extends MyModule {
  final LoginScreen _loginScreen;
  final RegisterScreen _registerScreen;

  AuthorizationModule(this._loginScreen, this._registerScreen);

  @override
  Map<String, WidgetBuilder> getRoutes() {
    return {
      AuthorizationRoutes.LOGIN_SCREEN: (context) => _loginScreen,
      AuthorizationRoutes.REGISTER_SCREEN: (context) => _registerScreen,
    };
  }
}
