
enum EditUserProfileStatus{SUCCESS ,LOADING , ERROR , INIT}

 class EditUserProfileState {
 final Map<String , dynamic> _data;
 final EditUserProfileStatus _status;
  EditUserProfileState(this._data,this._status);
  Map<String , dynamic> get data => data;
  EditUserProfileStatus get state => _status;
}
