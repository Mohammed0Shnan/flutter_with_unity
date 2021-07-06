
import 'package:rxdart/rxdart.dart';
import 'package:tut/module_education/service/education/education_service.dart';
import 'package:tut/module_education/states/level_states/level_state.dart';

class EducationLevelBloc {

  final stateSubject = PublishSubject<LevelState>();
  final EducationService _educationService = EducationService();

  void getLevels(){
    stateSubject.sink.add(LevelState(null,LevelStatus.LOADING));
     _educationService.getLevel().then((value) {
        if(value!= null){
      
        stateSubject.sink.add(LevelState(value,LevelStatus.LOADED));
        }else{
          stateSubject.sink.add(LevelState(null,LevelStatus.ERROR));
        }
      });
    }

 
    void dispose() { 
      stateSubject.close();
      
    }
  }
  