import 'package:flutter/material.dart';
import 'package:tut/module_education/bloc/education_level_bloc.dart';
import 'package:tut/module_education/states/level_states/level_state.dart';
import 'package:tut/module_education/states/level_states/level_state_loaded.dart';
import 'package:tut/module_settings/setting_routes.dart';
import 'package:tut/utils/back_ground/background.dart';
import 'package:tut/utils/size_configration/size_config.dart';

class EducationScreen extends StatefulWidget {
  final EducationLevelBloc _bloc;
  EducationScreen(this._bloc);
  @override
  _EducationScreenState createState() => _EducationScreenState();
}

class _EducationScreenState extends State<EducationScreen> {
  @override
  void initState() { 
    super.initState();
     widget._bloc.getLevels();
  }
  @override
  Widget build(BuildContext context) {
    
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
      StreamBuilder<LevelState>(
        initialData:LevelState(null,LevelStatus.LOADING) ,
      stream:  widget._bloc.stateSubject,
        builder: (context,AsyncSnapshot<LevelState> snapshot){
          if(snapshot.data.status ==  LevelStatus.LOADED)
          return EducationLevelStateLoaded(levels: snapshot.data.levels,);
          else if(snapshot.data.status ==  LevelStatus.LOADING){
            return Center(
              child: CircularProgressIndicator(),
            );
          }else{
             return Center(
              child: GestureDetector(
                onTap: (){
                  widget._bloc.getLevels();
                },
                child: Container(
                  child: Text('Error !!!',style: TextStyle(color: Colors.white),),)),
            );
          }
      }),
      
     
    ]));
  }

  
}
