enum EnumLoginState {INIT , SUCCESS, ERROR, LOADING }

class LoginState {
  final Map<String, dynamic> _data;
  final EnumLoginState _state;

  LoginState(this._data, this._state);

  Map<String , dynamic> get data => _data ; 
  EnumLoginState get state => this._state;
}
