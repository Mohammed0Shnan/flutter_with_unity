import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tut/module_profile/state_manager/user_profile.dart';
import 'package:tut/module_profile/ui/states/user_profile/profile_state_init.dart';
import 'package:tut/module_profile/ui/states/user_profile/user_profile_state.dart';

class UserProfileScreen extends StatelessWidget {
  final UserProfileStateManager _stateManager;
  UserProfileScreen(this._stateManager);
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UserProfileState>(
        initialData: UserProfileState(null, UserProfileStatus.LOADING),
        stream:_stateManager.stateSubject.stream ,
        builder: (context, AsyncSnapshot<UserProfileState> snapshot) {
          if (snapshot.data.state == UserProfileStatus.INIT) {
            return ProfileStateInit();
          } else if (snapshot.data.state == UserProfileStatus.SUCCESS) {
            return Container(
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text('Success'),
                ),
              ),
            );
          } else if (snapshot.data.state == UserProfileStatus.ERROR) {
            return Container(
              child: Center(
                child: GestureDetector(
                  onTap: () {
                     Navigator.pop(context);
                  },
                  child: Text('Error'),
                ),
              ),
            );
          } else {
            return Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}
