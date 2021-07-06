

import 'package:tut/module_profile/model/profile_model.dart';

enum UserProfileStatus{SUCCESS ,LOADING , ERROR , INIT}

 class UserProfileState {
 final ProfileModel _data;
 final UserProfileStatus _status;
  UserProfileState(this._data,this._status);
  ProfileModel get data => _data;
  UserProfileStatus get state => _status;
}
