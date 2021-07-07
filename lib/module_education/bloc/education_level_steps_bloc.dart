import 'package:rxdart/rxdart.dart';
import 'package:tut/module_education/service/education/education_service.dart';
import 'package:tut/module_education/states/level_states/level_step_state%20.dart';

class EducationLevelStepsBloc {
  final stateSubject = PublishSubject<LevelStepState>();
  final EducationService _educationService = EducationService();

  void getStepByLevelId(String levelId) {
    stateSubject.sink.add(LevelStepState(null, LevelStatus.LOADING));
    _educationService.getStepByLevelId(levelId).then((value) {
      if (value != null) {
        stateSubject.sink.add(LevelStepState(value, LevelStatus.LOADED));
      } else {
        stateSubject.sink.add(LevelStepState(null, LevelStatus.ERROR));
      }
    });
  }

  void dispose() {
    stateSubject.close();
  }
}
