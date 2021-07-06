

import 'package:rxdart/rxdart.dart';
import 'package:tut/module_profile/request/profile/profile_request.dart';
import 'package:tut/module_profile/service/profile/profile.service.dart';
import 'package:tut/module_profile/ui/states/edit_profile_state/edit_profile_state.dart';
import 'package:tut/module_upload/service/image_upload/image_upload_service.dart';

class EditProfileStateManager {
  final _stateSubject = PublishSubject<EditUserProfileState>();
  final ImageUploadService _imageUploadService = ImageUploadService();
  final ProfileService _profileService = ProfileService();

  Stream<EditUserProfileState> get stateStream => _stateSubject.stream;

  void uploadImage(
       ProfileRequest request, services) {
    _imageUploadService.uploadImage(request.image).then((uploadedImageLink) {
      request.image = uploadedImageLink;
      
    });
  }

  void submitProfile(
     ProfileRequest request) {
   // _stateSubject.add(ProfileStateLoading(screenState));
    _profileService.updateProfile(request).then((value) {
      if (value) {
        //_stateSubject.add(ProfileStateSaveSuccess(screenState));
      } else {
        print(request);
        //_stateSubject.add(ProfileStateGotProfile(screenState, request, null));
      }
    });
  }

  // void getProfile(EditProfileScreenState screenState) {
  //   _stateSubject.add(ProfileStateLoading(screenState));
  //   _profileService.getMyProfile().then((value) {
  //     if (value == null) {
  //       _stateSubject.add(ProfileStateNoProfile(screenState, ProfileRequest()));
  //     } else {
  //       _stateSubject.add(
  //         ProfileStateGotProfile(
  //             screenState,
  //             ProfileRequest(
  //               userName: value.firstName,
  //               lastName: value.lastName,
  //               image: value.image,
  //               phone: value.phone,
  //               type: value.type,
  //             ),
  //             value.services),
  //       );
  //     }
  //   }).catchError((e) {
  //     debugPrint(e.toString());
  //     if (e is UnauthorizedException) {
  //       _stateSubject.add(ProfileStateUnauthorized(screenState));
  //       //  screenState.moveToLogin();
  //     }
  //   });
  // }
}
