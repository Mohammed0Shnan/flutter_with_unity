import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:tut/abstracts/module/my_module.dart';
import 'package:tut/module_education/education_routes.dart';
import 'package:tut/module_education/screen/education_screen.dart';
import 'package:tut/module_education/widgets/education_level_step_card.dart';

class EducationModule extends MyModule {
  final EducationScreen _educationScreen;
  final EducationLevelStepCard _educationLevelStepCard;
  EducationModule(this._educationScreen, this._educationLevelStepCard);

  @override
  Map<String, WidgetBuilder> getRoutes() => {
        EducationRoutes.EDUCATION_SCREEN: (context) => _educationScreen,
        EducationRoutes.EDUCATION_LEVEL_STEP_SCREEN: (context) =>
            _educationLevelStepCard
      };
}
