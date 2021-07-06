import 'package:flutter/cupertino.dart';
import 'package:tut/abstracts/module/my_module.dart';
import 'package:tut/module_wrapper/wrapper.dart';
import 'package:tut/module_wrapper/wrapper_route.dart';


class WapperModule extends MyModule{
  final Wrapper _wrapper;
  WapperModule(this._wrapper);

  @override
  Map<String , WidgetBuilder> getRoutes()=>{
    WrapperRoutes.WRAPPER_ROUTE:(context)=> _wrapper
  };
  
} 