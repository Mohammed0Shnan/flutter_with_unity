import 'package:flutter/material.dart';
import 'package:tut/module_auth/authoriazation_module.dart';
import 'package:tut/module_auth/bloc/login_bloc/login_bloc.dart';
import 'package:tut/module_auth/bloc/register_bloc/register_bloc.dart';
import 'package:tut/module_auth/ui/screen/login_screen/login_screen.dart';
import 'package:tut/module_auth/ui/screen/register_screen/register_screen.dart';
import 'package:tut/module_education/bloc/education_level_bloc.dart';
import 'package:tut/module_education/education_module.dart';
import 'package:tut/module_education/screen/education_screen.dart';
import 'package:tut/module_education/widgets/education_level_step_card.dart';
import 'package:tut/module_home/home_module.dart';
import 'package:tut/module_home/screen/home_screen.dart';
import 'package:tut/module_profile/module_profile.dart';
import 'package:tut/module_profile/state_manager/edit_profile.dart';
import 'package:tut/module_profile/state_manager/user_profile.dart';
import 'package:tut/module_profile/ui/screen/edit_profile/edit_profile.dart';
import 'package:tut/module_profile/ui/screen/user_profile/user_profile.dart';
import 'package:tut/module_settings/settings_module.dart';
import 'package:tut/module_settings/ui/settings_page/settings_page.dart';
import 'package:tut/module_wrapper/wrapper_module.dart';
import 'package:tut/module_wrapper/wrapper_route.dart';
import 'package:tut/module_wrapper/wrapper.dart';
import 'package:tut/welcome.dart';

void main() {
  // to save status (realize injection)
  HomeScreen _homeScreen = HomeScreen();
  LoginScreen _loginScreen = LoginScreen(LoginBloC());
  RegisterScreen _registerScreen = RegisterScreen(RegisterBloC());

  runApp(MyApp(
      WapperModule(Wrapper(Welcome(), _homeScreen)),
      HomeModule(_homeScreen),
      AuthorizationModule(_loginScreen, _registerScreen),
      SettingsModule(SettingsScreen()),
      ProfileModule(EditProfileScreen(EditProfileStateManager()), UserProfileScreen(UserProfileStateManager())),
      EducationModule(EducationScreen(EducationLevelBloc()),EducationLevelStepCard())
      ));
}

class MyApp extends StatefulWidget {
  // Here the module is enjected
  //
  //

  // Define verification status
  final WapperModule _wapperModule;

  final HomeModule _homeModule;
  final AuthorizationModule _authorizationModule;

  final SettingsModule _settingsModule;
  final ProfileModule _profileModule;
  final EducationModule _educationModule;
  MyApp(this._wapperModule, this._homeModule, this._authorizationModule,
      this._settingsModule, this._profileModule,this._educationModule);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    Map<String, WidgetBuilder> routes = {};
    routes.addAll(widget._wapperModule.getRoutes());
    routes.addAll(widget._homeModule.getRoutes());
    routes.addAll(widget._authorizationModule.getRoutes());
    routes.addAll(widget._settingsModule.getRoutes());
    routes.addAll(widget._profileModule.getRoutes());
    routes.addAll(widget._educationModule.getRoutes());
    return configuratedApp(routes);
  }

  Widget configuratedApp(Map<String, WidgetBuilder> routes) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Anatomy',
      routes: routes,
      initialRoute: WrapperRoutes.WRAPPER_ROUTE,
    );
  }
}
