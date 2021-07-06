import 'package:flutter/material.dart';

class EducationLevelStepCard extends StatelessWidget {
  final String text;
  final bool isLock;
  EducationLevelStepCard({this.text, this.isLock});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
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
            isLock?
            Icon(
              Icons.lock,
              size: 20,
              color: Colors.white,
            ):SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}
