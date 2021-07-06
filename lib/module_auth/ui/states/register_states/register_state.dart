
enum EnumRegisterState { INIT,SUCCESS, ERROR, LOADING ,CONFIRMD }

class RegisterState {
  final Map<String, dynamic> data;
  final EnumRegisterState state;

  RegisterState({this.data, this.state});
  
  EnumRegisterState getState() => this.state;
}
