
import 'package:tut/module_auth/service/auth_service/auth_service.dart';
import 'package:tut/module_profile/manager/profile/profile.manager.dart';
import 'package:tut/module_profile/model/profile_model.dart';
import 'package:tut/module_profile/request/profile/profile_request.dart';

class ProfileService {
  final ProfileManager _manager = ProfileManager();
  final AuthService _authService = AuthService();


  // ignore: missing_return
  Future<ProfileModel> getMyProfile() async {

     // ProfileResponseModel responseModel = await _manager.getMyProfile();
     return ProfileModel(
       name: 'name example',
       description: 'description',
       email: 'email',
       phone: '092398948394',
       status: 'status',
       image: 'image path'
     );
  }

  Future<bool> updateProfile(ProfileRequest profileRequest) async {

    var profileUpdated = await _manager.updateProfile(profileRequest);
    return profileUpdated != null;
  }
}
