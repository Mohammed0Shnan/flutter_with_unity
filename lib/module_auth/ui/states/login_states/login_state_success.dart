import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tut/module_home/home_routes.dart';

Widget buildLoginStateSuccess(context, Map data) {
  return GestureDetector(
    onTap: () {
      Navigator.of(context).pushNamed(HomeRoutes.HOME_SCREEN);
    },
    child: (Center(
      child: Container(
        alignment: Alignment.center,
        height: 50,
        width: 150,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.brown.shade400),
        child: Text(
          'Success',
          style: TextStyle(color: Colors.white),
        ),
      ),
    )),
  );
}
