

import 'package:tut/consts/urls.dart';
import 'package:tut/module_auth/request/login_request/login_request.dart';
import 'package:tut/module_auth/request/register_request/register_request.dart';
import 'package:tut/module_auth/response/login_response/login_response.dart';
import 'package:tut/module_network/http_client/http_client.dart';

class AuthRepository {
  final ApiClient _apiClient = ApiClient();

  Future<bool> createUser(RegisterRequest request) async {
    var result = await _apiClient.post(Urls.SIGN_UP_API, request.toJson());
    return result != null;
  }

  Future<LoginResponse> getToken(LoginRequest loginRequest) async {
    var result = await _apiClient.post(
      Urls.CREATE_TOKEN_API,
      loginRequest.toJson(),
    );
    if (result == null) {
      return null;
    }
    return LoginResponse.fromJson(result);
  }
}
