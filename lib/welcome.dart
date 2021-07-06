import 'package:flutter/material.dart';
import 'package:tut/module_auth/authorization_routes.dart';
import 'package:tut/utils/back_ground/background.dart';
import 'package:tut/utils/size_configration/size_config.dart';
import 'package:page_indicator/page_indicator.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  PageController pageController;
  int _currentIndex = 0;
  @override
  void initState() {
    super.initState();
    pageController = PageController(
      initialPage: _currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      color: Colors.white,
      letterSpacing: 1,
      fontSize: 24,
    );
    return Background(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: SizeConfig.screenHeight * 0.22,
        ),
        Text(
          'Welcome',
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
              fontSize: 39,
              fontStyle: FontStyle.italic),
        ),
        SizedBox(
          height: 70,
        ),
        Expanded(
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: PageIndicatorContainer(
              child: PageView(
                allowImplicitScrolling: false,
                onPageChanged: (index) {
                  _currentIndex = index;
                  setState(() {});
                },
                children: <Widget>[
                  Text(
                    '11111111111111eifniwe weifniwe weifniwe iwnf iwenrf inwqer iwnfiwejfiwejfiwef weifnwief kwienfiw ',
                    textAlign: TextAlign.center,
                    style: textStyle,
                  ),
                  Text(
                    '2222222222222eifniwe weifniwe weifniwe iwnf iwenrf inwqer iwnfiwejfiwejfiwef weifnwief kwienfiw ',
                    textAlign: TextAlign.center,
                    style: textStyle,
                  ),
                  Text(
                    '333333333333333eifniwe weifniwe weifniwe iwnf iwenrf inwqer iwnfiwejfiwejfiwef weifnwief kwienfiw ',
                    textAlign: TextAlign.center,
                    style: textStyle,
                  ),
                ],
                controller: pageController,
              ),
              align: IndicatorAlign.bottom,
              shape: IndicatorShape.roundRectangleShape(size: Size(20.0, 20.0)),
              length: 3,
              indicatorSpace: 15.0,
            ),
          ),
        ),
        SizedBox(
          height: SizeConfig.screenHeight * 0.08,
        ),
        GestureDetector(
          onTap: () {
            if (_currentIndex == 2) {
              Navigator.of(context).pushNamed(AuthorizationRoutes.REGISTER_SCREEN);
            } else {
              _currentIndex = _currentIndex + 1;
              pageController.jumpToPage(_currentIndex);
            }
          },
          child: Container(
              alignment: Alignment.center,
              height: 55,
              width: 150,
              decoration: BoxDecoration(
                  color: Colors.brown.shade400,
                  gradient: LinearGradient(
                    colors: [Colors.brown.shade400, Colors.brown.shade200],
                  ),
                  borderRadius: BorderRadius.circular(30)),
              child: Text('Next',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white))),
        ),
        SizedBox(
          height: SizeConfig.screenHeight * 0.1,
        )
      ],
    ));
  }
}
