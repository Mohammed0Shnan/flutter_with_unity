
import 'package:tut/consts/urls.dart';
import 'package:tut/module_auth/exceptions/auth_exception.dart';
import 'package:tut/module_auth/service/auth_service/auth_service.dart';
import 'package:tut/module_education/response/level_response.dart';
import 'package:tut/module_network/http_client/http_client.dart';
class EducationRepository {
  final ApiClient _apiClient = ApiClient();
  final AuthService _authService = AuthService();


  Future<EducationLevelResponse> getLevel() async {
    String token;
    try {
      await _authService.refreshToken();
      token = await _authService.getToken();
    } catch (e) {
      throw UnauthorizedException('Get Profile Null Token');
    }
    if (token == null) throw UnauthorizedException('Get Profile Null Token');
    dynamic response = await _apiClient.get(
      Urls.PROFILE_API,
      headers: {'Authorization': 'Bearer ' + token},
    );

    try {
      if (response == null) return null;
      return EducationLevelResponse.fromJson(response);
    } catch (e) {
      return null;
    }
  }


 
  
}
