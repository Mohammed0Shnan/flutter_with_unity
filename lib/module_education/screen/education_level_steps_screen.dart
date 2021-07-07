import 'package:flutter/material.dart';
import 'package:tut/module_education/bloc/education_level_steps_bloc.dart';
import 'package:tut/module_education/states/level_states/level_step_state%20.dart';
import 'package:tut/module_settings/setting_routes.dart';
import 'package:tut/utils/back_ground/background.dart';
import 'package:tut/utils/size_configration/size_config.dart';

class EducationLevelStepsScreenState extends StatelessWidget {
    final EducationLevelStepsBloc _bloc;
  EducationLevelStepsScreenState(this._bloc);
   
   WidgetsFlutterBinding(){}
  @override
  Widget build(BuildContext context) {
    
   var levelID = ModalRoute.of(context).settings.arguments;
  
    return Background(
        child: ListView(children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 40,
              width: 50,
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                padding: EdgeInsets.only(right: 40, top: 20),
                icon: Icon(
                  Icons.arrow_back_outlined,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
            Container(
              height: 40,
              width: 50,
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(SettingRoutes.ROUTE_SETTINGS);
                },
                padding: EdgeInsets.only(right: 40, top: 20),
                icon: Icon(
                  Icons.menu,
                  color: Colors.white,
                  size: 40,
                ),
              ),
            ),
          ],
        ),
      ),
      SizedBox(
        height: SizeConfig.heightMulti * 10,
      ),
      StreamBuilder<LevelStepState>(
          initialData: LevelStepState(null, LevelStatus.LOADING),
          stream: _bloc.stateSubject.stream,
          builder: (context, AsyncSnapshot<LevelStepState> snapshot) {
            if (snapshot.data.status == LevelStatus.LOADED)
              // return EducationLevelStateLoaded();
              return Container();
            else if (snapshot.data.status == LevelStatus.LOADING) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Center(
                child: GestureDetector(
                    onTap: () {
                      _bloc.getStepByLevelId(levelID);
                    },
                    child: Container(
                      child: Text(
                        'Error !!!',
                        style: TextStyle(color: Colors.white),
                      ),
                    )),
              );
            }
          }),
    ]));
  }
}
