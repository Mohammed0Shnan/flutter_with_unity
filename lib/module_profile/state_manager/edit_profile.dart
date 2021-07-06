import 'package:rxdart/rxdart.dart';
import 'package:tut/module_profile/request/profile/profile_request.dart';
import 'package:tut/module_profile/service/profile/profile.service.dart';
import 'package:tut/module_profile/ui/states/edit_profile_state/edit_profile_state.dart';
import 'package:tut/module_upload/service/image_upload/image_upload_service.dart';

class EditProfileStateManager {
  final ImageUploadService _imageUploadService = ImageUploadService();
  final ProfileService _profileService = ProfileService();
  final stateSubject = PublishSubject<EditUserProfileState>();

  final ProfileService _service = ProfileService();

  Stream<EditUserProfileState> get stateStream => stateSubject.stream;

  void uploadImage(ProfileRequest request, services) {
    _imageUploadService.uploadImage(request.image).then((uploadedImageLink) {
      request.image = uploadedImageLink;
    });
  }

  void submitProfile(ProfileRequest request) {
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

  void getProfile() {

    _profileService.getMyProfile().then((value) {
      if (value != null) {
        stateSubject.sink.add(EditUserProfileState(
           value, null, EditUserProfileStatus.INIT));
      } else {
        stateSubject.sink.add(EditUserProfileState(
            value, 'error load profile', EditUserProfileStatus.ERROR));
      }
    });
  }

  void dispose() {
    stateSubject.close();
  }
}
