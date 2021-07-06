import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tut/utils/size_configration/size_config.dart';

class Header extends StatelessWidget {
  final String text;
  const Header({
    this.text,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: SizeConfig.screenWidth,
          height: SizeConfig.screenHeight * 0.33,
        ),
        Positioned(
          left: -100,
          top: -100,
          child: Container(
              height: SizeConfig.imageSize * 84,
              child: SvgPicture.asset(
                'assets/shape.svg',
              )),
        ),
        Positioned(
            left: 20,
            top: SizeConfig.screenHeight * 0.14,
            child: Text(
              text,
              style: TextStyle(
                  fontSize: 34,
                  letterSpacing: 1,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic),
            ))
      ],
    );
  }
}
