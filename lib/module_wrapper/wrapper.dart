import 'package:flutter/material.dart';
import 'package:tut/module_home/screen/home_screen.dart';
import 'package:tut/module_persistence/sharedpref/shared_preferences_helper.dart';
import 'package:tut/utils/auth_guard/auth_gard.dart';
import 'package:tut/utils/size_configration/size_config.dart';
import 'package:tut/welcome.dart';

class Wrapper extends StatelessWidget {
  //final AuthGuard _authGuard = AuthGuard(SharedPreferencesHelper());
  //final AuthGuard _authGuard = AuthGuard(null);
  final Welcome _welcome;
  final HomeScreen _homeScreen;
  Wrapper(this._welcome, this._homeScreen);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(MediaQuery.of(context).size);
    return _welcome;
    // return FutureBuilder<bool>(
    //   initialData: false,
    //   future: _authGuard.isLoggedIn(),
    //   builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
    //     if (snapshot.data) {
    //       return _homeScreen;
    //     } else {
    //       return _welcome;
    //     }
    //   },
    
  
}}
