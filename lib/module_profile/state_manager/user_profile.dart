
import 'package:rxdart/rxdart.dart';
import 'package:tut/module_profile/service/profile/profile.service.dart';
import 'package:tut/module_profile/ui/states/user_profile/user_profile_state.dart';

class UserProfileStateManager {
  final stateSubject = PublishSubject<UserProfileState>();

  final ProfileService _service = ProfileService();

  void getProfile(){
     _service.getMyProfile().then((value) {
        if(value!= null){
        stateSubject.sink.add(UserProfileState({},UserProfileStatus.SUCCESS));
        }else{
          stateSubject.sink.add(UserProfileState({},UserProfileStatus.ERROR));
        }
      });
    }

 
    void dispose() { 
      stateSubject.close();
      
    }
  }
  

