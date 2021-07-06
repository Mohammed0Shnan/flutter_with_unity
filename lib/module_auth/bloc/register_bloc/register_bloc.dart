import 'package:tut/module_auth/service/auth_service/auth_service.dart';
import 'package:tut/module_auth/enums/auth_status.dart';
import 'package:tut/module_auth/model/app_user.dart';
import 'package:tut/module_auth/ui/states/register_states/register_state.dart';
import 'package:rxdart/rxdart.dart';

class RegisterBloC {
  final AuthService _authService = AuthService();
  final _registerStateSubject = BehaviorSubject<RegisterState>();

  RegisterBloC();

  Stream<RegisterState> get stateStream => _registerStateSubject.stream;

  void registerUser(AppUser user) {
    _registerStateSubject.sink
        .add(RegisterState(data: null, state: EnumRegisterState.LOADING));
    _authService.registerApiUser(user);
    _authService.authListener.listen((event) {
      switch (event) {
        case AuthStatus.AUTHORIZED:
          _registerStateSubject
              .add(RegisterState(data: null, state: EnumRegisterState.SUCCESS));
          break;
        default:
          _registerStateSubject.add(RegisterState(
              data: {'user': user}, state: EnumRegisterState.INIT));
          break;
      }
    }).onError((err) {
      _registerStateSubject.add(RegisterState(
          data: {'data': 'Error in Sign Up'}, state: EnumRegisterState.ERROR));
    });
    // _authService.registerWithEmailAndPassword(
    //     email, password, name, UserRole.ROLE_USER);
  }

  void confirmCode(String smsCode) {
        _registerStateSubject.sink
        .add(RegisterState(data: null, state: EnumRegisterState.LOADING));
        _authService.confirmWithCode(smsCode);
         _authService.authListener.listen((event) {
      switch (event) {
        case AuthStatus.CODE_SENT:
          _registerStateSubject
              .add(RegisterState(data: null, state: EnumRegisterState.CONFIRMD));
          break;
        default:
          _registerStateSubject.add(RegisterState(
              data: {'code': smsCode}, state: EnumRegisterState.SUCCESS));
          break;
      }
    }).onError((err) {
      _registerStateSubject.add(RegisterState(
          data: {'data': 'Error in Confirm Code'}, state: EnumRegisterState.ERROR));
    });
  }
}
