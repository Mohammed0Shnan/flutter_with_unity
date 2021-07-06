import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tut/module_auth/authorization_routes.dart';
import 'package:tut/module_auth/service/auth_service/auth_service.dart';
import 'package:tut/module_profile/profile_routes.dart';
import 'package:tut/module_profile/service/profile/profile.service.dart';
import 'package:tut/utils/size_configration/size_config.dart';

class SettingsScreen extends StatefulWidget {
  final AuthService _authService = AuthService();
  final ProfileService _profileService = ProfileService();

  @override
  State<StatefulWidget> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
              height: SizeConfig.screenHeight,
              width: SizeConfig.screenWidth,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                Colors.brown.shade400,
                Colors.brown.shade200,
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter))),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: ListView(
              shrinkWrap: true,
              children: [
                SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                      icon: Icon(
                        Icons.arrow_back_outlined,
                        color: Colors.white,
                        size: 30,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      }),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Text(
                      'Setting',
                      style: TextStyle(
                        letterSpacing: 1,
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                SizedBox(
                  height: 50,
                ),
                _buildOption(context,
                    preIcon: Icons.person, text: 'Profile Setting',
                    function: (){
                      Navigator.pushNamed(context,ProfileRoutes.PROFILE_SCREEN);
                    }
                    ),
                   
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.brown),
                            child: Icon(Icons.language,
                                size: 18, color: Colors.white),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text('Language',
                              style: TextStyle(
                                letterSpacing: 1,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 21,
                              )),
                          Spacer(),
                          FutureBuilder<String>(
                            initialData: 'ar',
                            future: null,
                            builder: (context, AsyncSnapshot<String> snapshot) {
                              if (snapshot.data == 'ar') {
                                return Switch(
                                    value: true,
                                    activeColor: Colors.brown,
                                    onChanged: (val) {
                                      // functionChangeValue
                                    });
                              } else {
                                return Switch(
                                    value: false,
                                    onChanged: (val) {
                                      // functionChangeValue
                                    });
                              }
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                _buildOption(context,
                    preIcon: Icons.policy, text: 'Privacy Policy'),
                SizedBox(
                  height: 20,
                ),
                _buildOption(context,
                    preIcon: Icons.dock_rounded, text: 'Terms'),
                SizedBox(
                  height: 20,
                ),
                _buildOption(context,
                    preIcon: Icons.feedback, text: 'Feedback'),
                SizedBox(
                  height: 20,
                ),
                _buildOption(context, preIcon: Icons.logout, text: 'Logout',
                    function: () {
                  widget._authService.logout().then((value) {
                    Navigator.of(context).pushReplacementNamed(
                      AuthorizationRoutes.LOGIN_SCREEN,
                    );
                  });
                }),
                SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Padding _buildOption(BuildContext context,
      {String text, IconData preIcon, Function function}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: GestureDetector(
        onTap: function,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                height: 30,
                width: 30,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.brown),
                child: Icon(preIcon, size: 18, color: Colors.white),
              ),
              SizedBox(
                width: 20,
              ),
              Text(text,
                  style: TextStyle(
                    letterSpacing: 1,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 21,
                  )),
              Spacer(),
              Icon(
                Icons.navigate_next,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<Widget> _getCaptainStateSwitch() async {
    // var userRole = await widget._authService.userRole;
    // print('${userRole}');
    // if (userRole == UserRole.ROLE_COMPANY) {
    //   return Container();
    // } else {
    //   // The User is a captain
    //   var profile = await widget._profileService.getMyProfile();
    //   return Padding(
    //     padding: const EdgeInsets.all(8.0),
    //     child: Container(
    //       decoration: BoxDecoration(
    //         borderRadius: BorderRadius.all(Radius.circular(8)),
    //         color: Colors.black12,
    //       ),
    //       child: Padding(
    //         padding: const EdgeInsets.all(8.0),
    //         child: Flex(
    //           direction: Axis.horizontal,
    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //           children: [
    //             Text(
    //               'My Status',
    //               // S.of(context).myStatus
    //             ),
    //             Switch(
    //               onChanged: (bool value) {
    //                 widget._notificationService.setCaptainActive(value);
    //                 widget._profileService.updateProfile(
    //                   ProfileRequest(
    //                     userName: profile.firstName,
    //                     lastName: profile.lastName,
    //                     image: profile.image,
    //                     phone: profile.phone,
    //                     location: profile.location,
    //                   ),
    //                 );
    //               },
    //               value: profile.location != null,
    //             )
    //           ],
    //         ),
    //       ),
    //     ),
    //   );
    // }
  }
}
