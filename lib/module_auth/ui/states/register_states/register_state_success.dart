import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tut/module_auth/ui/widget/header.dart';
import 'package:tut/utils/size_configration/size_config.dart';


class IsertedCondeState extends StatelessWidget {
 final String code;
  final Function(String) onConfirmRequest;

IsertedCondeState({this.code,this.onConfirmRequest}){
  _code = TextEditingController();
}
 TextEditingController _code;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Header(
            text: 'Confirm',
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30),
            child: TextField(
              controller: _code,
              style: TextStyle(fontSize: 19, height: 1),
              obscureText: true,
              decoration: InputDecoration(
                  labelText: 'Inserted Code',
                  labelStyle: TextStyle(
                      color: Colors.brown,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                  suffixIcon: Icon(
                    Icons.delete_sharp,
                    color: Colors.brown,
                    size: 26,
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 15, vertical: 10)),
            ),
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.3),
          GestureDetector(
            onTap: () {
               onConfirmRequest(_code.text);
            },
            child: Container(
                alignment: Alignment.center,
               margin: EdgeInsets.symmetric(horizontal:80),
               
                height: 55,
                decoration: BoxDecoration(
                    color: Colors.brown.shade400,
                    gradient: LinearGradient(
                      colors: [Colors.brown.shade400, Colors.brown.shade200],
                    ),
                    borderRadius: BorderRadius.circular(30)),
                child: Text('Confirm',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white))),
          ),
        ],
      ),
    );
  }
}
