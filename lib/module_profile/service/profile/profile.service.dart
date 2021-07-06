
import 'package:tut/module_auth/service/auth_service/auth_service.dart';
import 'package:tut/module_profile/manager/profile/profile.manager.dart';
import 'package:tut/module_profile/model/profile_model.dart';
import 'package:tut/module_profile/request/profile/profile_request.dart';
import 'package:tut/module_profile/response/profile_response.dart';

class ProfileService {
  final ProfileManager _manager = ProfileManager();
  final AuthService _authService = AuthService();


  // ignore: missing_return
  Future<ProfileModel> getMyProfile() async {

     // ProfileResponseModel responseModel = await _manager.getMyProfile();
     return ProfileModel();
      // for laze loaded
      // List<ServiceModel> _services = await _servicesService.getServices();

      // for eager loaded
    //   List<ServiceModel> _services = [];
    //   responseModel.services.forEach((element) {
    //     ServiceModel serviceModel = ServiceModel(
    //         id: element.id.toString(),
    //         name: element.serviceTitle,
    //         description: element.description,
    //         categoryId: element.categoryID.toString(),
    //         rate: element.avgRating);
    //     _services.add(serviceModel);
    //   });
    //   return ProfileModel(
    //       firstName: responseModel.userName,
    //       lastName: responseModel.lastName,
    //       image: responseModel.image,
    //       type: role,
    //       services: _services);
    // } catch (e) {
    //   if (e is UnauthorizedException) rethrow;
    // }
  }

  Future<bool> updateProfile(ProfileRequest profileRequest) async {

    var profileUpdated = await _manager.updateProfile(profileRequest);
    return profileUpdated != null;
  }
}
