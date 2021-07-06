import 'package:tut/module_auth/enums/auth_status.dart';
import 'package:tut/module_auth/service/auth_service/auth_service.dart';
import 'package:tut/module_auth/ui/states/login_states/login_state.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloC {
  final AuthService _authService = AuthService();
  final BehaviorSubject<LoginState> _loginStateSubject =
      BehaviorSubject<LoginState>();

  String _email;
  String _password;

  LoginBloC() {
    _authService.authListener.listen((event) {
      if (event == AuthStatus.AUTHORIZED) {
        _loginStateSubject.add(LoginState({}, EnumLoginState.SUCCESS));
      } else {
        _loginStateSubject.add(LoginState({}, EnumLoginState.ERROR));
      }
    });
  }

  Stream<LoginState> get stateStream => _loginStateSubject.stream;

  void login(String email, String password) {
    _email = email;
    _password = password;
            _loginStateSubject.sink
        .add(LoginState( null, EnumLoginState.LOADING));
    _authService.authListener.listen((event) {
      switch (event) {
        case AuthStatus.AUTHORIZED:
          break;
        default:
          break;
      }
    }).onError((err) {
      _loginStateSubject.add(LoginState({}, EnumLoginState.SUCCESS));
    });

    _authService.loginApiUser(
        email, password);
  }

  void confirmSMSCode(String smsCode) {
    //_authService.confirmWithCode(smsCode, UserRole.ROLE_COMPANY);
  }

}
