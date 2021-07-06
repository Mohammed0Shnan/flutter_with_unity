import 'package:flutter/material.dart';
import 'package:tut/module_education/models/level_model.dart';
import 'package:tut/module_education/widgets/education_level_card.dart';

class EducationLevelStateLoaded  extends StatelessWidget {
final List<LevelModel> levels;
EducationLevelStateLoaded({this.levels});
  @override
  Widget build(BuildContext context) {
        return Container(
      margin: EdgeInsets.symmetric(horizontal: 25),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: levels.length,
        itemBuilder: (context,index){
          return  EducationLevelCard(text: levels[index].levelNname,state: levels[index].levelStatus,);
        }),
    );
  }
}