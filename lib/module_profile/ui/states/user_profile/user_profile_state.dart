

enum UserProfileStatus{SUCCESS ,LOADING , ERROR , INIT}

 class UserProfileState {
 final Map<String , dynamic> _data;
 final UserProfileStatus _status;
  UserProfileState(this._data,this._status);
  Map<String , dynamic> get data => data;
  UserProfileStatus get state => _status;
}
