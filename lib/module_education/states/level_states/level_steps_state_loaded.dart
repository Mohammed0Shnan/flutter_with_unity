import 'package:flutter/material.dart';
import 'package:tut/module_education/models/level_model.dart';
import 'package:tut/module_education/widgets/education_level_step_card.dart';

class EducationLevelStepsStateLoaded  extends StatelessWidget {
final List<LevelModel> levels;
EducationLevelStepsStateLoaded({this.levels});
  @override
  Widget build(BuildContext context) {
        return Container(
      margin: EdgeInsets.symmetric(horizontal: 25),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: levels.length,
        itemBuilder: (context,index){
          return  EducationLevelStepCard(text: levels[index].levelNname,isLock: true,);
        }),
    );
  }
}