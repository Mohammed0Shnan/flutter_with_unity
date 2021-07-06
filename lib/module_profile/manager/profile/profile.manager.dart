
import 'package:tut/module_profile/repository/profile/profile.repository.dart';
import 'package:tut/module_profile/request/profile/profile_request.dart';
import 'package:tut/module_profile/response/profile_response.dart';

class ProfileManager {
  final ProfileRepository _repository = ProfileRepository();


  Future<ProfileResponseModel> getMyProfile() => _repository.getMyProfile();


  Future<ProfileResponse> updateProfile(ProfileRequest profileRequest) =>
      _repository.updateProfile(profileRequest);
}
