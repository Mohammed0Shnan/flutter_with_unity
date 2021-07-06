import 'package:tut/module_profile/model/profile_model.dart';

enum EditUserProfileStatus { LOADING, ERROR , INIT ,SUCCESS }

class EditUserProfileState {
  final ProfileModel _data;
  final EditUserProfileStatus _status;
  final String _error;
  EditUserProfileState(this._data,this._error ,this._status);
  ProfileModel get data => _data;
  EditUserProfileStatus get state => _status;
  String get error => _error;
}
