import 'package:flutter/cupertino.dart';
import 'package:tut/abstracts/module/my_module.dart';
import 'package:tut/module_home/home_routes.dart';
import 'package:tut/module_home/screen/home_screen.dart';


class HomeModule extends MyModule{
  final HomeScreen _homeScreen;
  HomeModule(this._homeScreen);

  @override
  Map<String , WidgetBuilder> getRoutes()=>{
    HomeRoutes.HOME_SCREEN:(context)=> _homeScreen
  };
  
} 