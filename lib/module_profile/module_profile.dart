
import 'package:flutter/material.dart';
import 'package:tut/abstracts/module/my_module.dart';
import 'package:tut/module_profile/profile_routes.dart';
import 'package:tut/module_profile/ui/screen/edit_profile/edit_profile.dart';
import 'package:tut/module_profile/ui/screen/user_profile/user_profile.dart';

class ProfileModule extends MyModule {
  final EditProfileScreen editProfileScreen;
  final UserProfileScreen userProfileScreen;

  ProfileModule(this.editProfileScreen, this.userProfileScreen);

  @override
  Map<String, WidgetBuilder> getRoutes() {
    return {
      ProfileRoutes.EDIT_PROFILE_SCREEN: (context) => editProfileScreen,
      ProfileRoutes.PROFILE_SCREEN: (context) => userProfileScreen,
    };
  }
}
