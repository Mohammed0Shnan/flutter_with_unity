import 'package:tut/module_education/models/level_step_model.dart';
enum LevelStatus { LOADED, ERROR, LOADING }

class LevelStepState {
  final List<LevelStepModel> steps;
  final LevelStatus status;
  LevelStepState(this.steps, this.status);
}
