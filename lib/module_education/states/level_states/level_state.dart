import 'package:tut/module_education/models/level_model.dart';

enum LevelStatus { LOADED, ERROR, LOADING }

class LevelState {
  final List<LevelModel> levels;
  final LevelStatus status;
  LevelState(this.levels, this.status);
}
