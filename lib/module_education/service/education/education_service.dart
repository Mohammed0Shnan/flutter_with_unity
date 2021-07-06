
import 'package:tut/consts/level_status.dart';
import 'package:tut/module_auth/service/auth_service/auth_service.dart';
import 'package:tut/module_education/models/level_model.dart';
import 'package:tut/module_education/repository/education/education_repository.dart';

class EducationService {
  final EducationRepository _repository =EducationRepository();
  final AuthService _authService = AuthService();
   

  // ignore: missing_return
  Future<List<LevelModel>> getLevel() async {

     
     return <LevelModel>[
       LevelModel('Level 1',LevelStatus.DONE),
       LevelModel('Level 2',LevelStatus.CURRENT),
       LevelModel('Level 3',LevelStatus.LOCK),
       LevelModel('Level 4',LevelStatus.LOCK),
       LevelModel('Level 5',LevelStatus.LOCK),
     ];
  }

}
