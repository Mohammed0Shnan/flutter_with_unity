
import 'package:tut/consts/level_status.dart';
import 'package:tut/consts/level_step_status.dart';
import 'package:tut/module_auth/service/auth_service/auth_service.dart';
import 'package:tut/module_education/models/level_model.dart';
import 'package:tut/module_education/models/level_step_model.dart';
import 'package:tut/module_education/repository/education/education_repository.dart';

class EducationService {
  final EducationRepository _repository =EducationRepository();
  final AuthService _authService = AuthService();
   

  // ignore: missing_return
  Future<List<LevelModel>> getLevel() async {

     
     return <LevelModel>[
       LevelModel('Level 1',EnumLevelStatus.DONE),
       LevelModel('Level 2',EnumLevelStatus.CURRENT),
       LevelModel('Level 3',EnumLevelStatus.LOCK),
       LevelModel('Level 4',EnumLevelStatus.LOCK),
       LevelModel('Level 5',EnumLevelStatus.LOCK),
     ];
  }

    Future<List<LevelStepModel>> getStepByLevelId(String levelId) async {
     return <LevelStepModel>[
       LevelStepModel('1',EnumLevelStepStatus.OPEN),
       LevelStepModel('2',EnumLevelStepStatus.NOT_OPEN),
       LevelStepModel('3',EnumLevelStepStatus.NOT_OPEN),
       LevelStepModel('4',EnumLevelStepStatus.NOT_OPEN),
       LevelStepModel('5',EnumLevelStepStatus.NOT_OPEN),
       LevelStepModel('6',EnumLevelStepStatus.NOT_OPEN),
     ];
  }

}
