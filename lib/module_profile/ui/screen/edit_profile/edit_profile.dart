import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tut/module_profile/model/profile_model.dart';
import 'package:tut/module_profile/state_manager/edit_profile.dart';
import 'package:tut/module_profile/state_manager/user_profile.dart';
import 'package:tut/module_profile/ui/states/edit_profile_state/edit_profile_state.dart';
import 'package:tut/module_profile/ui/states/edit_profile_state/edit_profile_state_init.dart';
import 'package:tut/module_profile/ui/states/edit_profile_state/edit_profile_state_loading.dart';
import 'package:tut/module_profile/ui/states/user_profile/profile_state_init.dart';
import 'package:tut/module_profile/ui/states/user_profile/user_profile_state.dart';

class EditProfileScreen extends StatefulWidget {
  final EditProfileStateManager _stateManager;
  EditProfileScreen(this._stateManager);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  void initState() {
      widget._stateManager.getProfile();
  }
  final UserProfileStateManager _stateManager = UserProfileStateManager();
  @override
  Widget build(BuildContext context) {
  
    return StreamBuilder<EditUserProfileState>(
      initialData:
          EditUserProfileState(null, null, EditUserProfileStatus.LOADING),
      stream: widget._stateManager.stateStream,
      builder: (context, AsyncSnapshot<EditUserProfileState> snapshot) {
         
        if (snapshot.data.state == EditUserProfileStatus.INIT) {
          print(snapshot.data.data);
          return EditProfileStateInit(
            errorSave: snapshot.data.error,
            profileModel: snapshot.data.data,
            onSaveRequest: (profileModel) {},
            onImageChange: (path) {},
          );
        } else if (snapshot.data.state == EditUserProfileStatus.ERROR) {
          return Scaffold(
            body: Container(
              child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Center(
                    child: Text('Error Load Profile'),
                  )),
            ),
          );
        } else if (snapshot.data.state == EditUserProfileStatus.SUCCESS) {
          return Container(
            child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Center(
                  child: Text('Success'),
                )),
          );
        } else
          return EditProfileStateLoading();
      },
    );
  }
}
