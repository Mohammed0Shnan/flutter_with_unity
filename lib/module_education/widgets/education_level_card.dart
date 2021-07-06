import 'package:flutter/material.dart';
import 'package:tut/consts/level_status.dart';
import 'package:tut/module_education/education_routes.dart';

class EducationLevelCard extends StatelessWidget {
  final String text;
  final LevelStatus state;
  EducationLevelCard({this.text, this.state});
  @override
  Widget build(BuildContext context) {
    IconData icon;
    if (state == LevelStatus.DONE)
      icon = Icons.check;
    else if (state == LevelStatus.LOCK)
      icon = Icons.lock;
    else {
      icon = Icons.memory_rounded;
    }
    return GestureDetector(
      onTap: () {
       Navigator.of(context).pushNamed(EducationRoutes.EDUCATION_LEVEL_STEP_SCREEN,arguments:text );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        height: 55,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Colors.brown.shade800,Colors.brown.shade300
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter
          ),
          borderRadius: BorderRadius.circular(10)
        ),
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 19,
                  fontWeight: FontWeight.bold),
            ),
            Icon(
              icon,
              size: 20,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
