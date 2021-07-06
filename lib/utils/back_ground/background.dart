import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tut/utils/size_configration/size_config.dart';

class Background extends StatelessWidget {
 final  Widget child;
Background({this.child});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        bottom: false,
        child: Stack(
          children: [
            Container(
              height: SizeConfig.screenHeight,
              width: SizeConfig.screenWidth,
              decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/background.jpg'),fit: BoxFit.cover,)),
            ),
            Center(child: child)
          ],
        ),
      ),
    );
  }
}