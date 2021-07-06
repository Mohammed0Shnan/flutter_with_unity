import 'package:tut/module_auth/repository/auth/auth_repository.dart';
import 'package:tut/module_auth/request/login_request/login_request.dart';
import 'package:tut/module_auth/request/register_request/register_request.dart';
import 'package:tut/module_auth/response/login_response/login_response.dart';

class AuthManager {
  final AuthRepository _authRepository = AuthRepository();

  Future<bool> register(RegisterRequest registerRequest) async {
    await Future.delayed(Duration(seconds: 2));
    return true;
    // _authRepository.createUser(registerRequest);
  }

  Future<bool> confirmCode(String code) async {
    await Future.delayed(Duration(seconds: 2));
    return true;
  }

  Future<LoginResponse> login(LoginRequest loginRequest) async{
    await Future.delayed(Duration(seconds: 2));
    return LoginResponse(token: 'jjjjjiknuiguyvhybkuihgu jfhgbfuyvuybrfuynguybtgurfujyni');
  // _authRepository.getToken(loginRequest);
  }
     
}
