import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tut/module_profile/model/profile_model.dart';
import 'package:tut/utils/size_configration/size_config.dart';

class EditProfileStateInit extends StatelessWidget {
  final Function(ProfileModel) onSaveRequest;
  final Function(String) onImageChange;
  final ProfileModel profileModel;
  final String errorSave;
  EditProfileStateInit(
      {this.onSaveRequest, this.profileModel, this.onImageChange,this.errorSave});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Container(
          height: SizeConfig.screenHeight,
          width: SizeConfig.screenWidth,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Colors.brown.shade400,
            Colors.brown.shade200,
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter))),
      Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(children: [
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(top: 40, left: 20),
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back_outlined,
                      color: Colors.white,
                      size: 30,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  children: [
                    TextField(
                   //   controller: _name,
                      style: TextStyle(fontSize: 19, height: 1),
                      decoration: InputDecoration(
                          labelText: 'Name',
                          labelStyle: TextStyle(
                              color: Colors.brown,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                          suffixIcon: Icon(
                            Icons.person,
                            color: Colors.white,
                            size: 26,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10)),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                     // controller: _name,
                      style: TextStyle(fontSize: 19, height: 1),
                      decoration: InputDecoration(
                          labelText: 'Phone number',
                          labelStyle: TextStyle(
                              color: Colors.brown,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                          suffixIcon: Icon(
                            Icons.mobile_friendly,
                            color: Colors.white,
                            size: 26,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10)),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                     /// controller: _name,
                      style: TextStyle(fontSize: 19, height: 1),
                      decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle: TextStyle(
                              color: Colors.brown,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                          suffixIcon: Icon(
                            Icons.email,
                            color: Colors.white,
                            size: 26,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10)),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              ListTile(
                title: Text(
                  'Status',
                  style: TextStyle(
                      color: Colors.brown.shade800,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      letterSpacing: 1),
                ),
                subtitle: Padding(
                    padding: EdgeInsets.only(top: 15),
                    child: Text(
                      'the user status',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Divider(
                  color: Colors.brown.shade600,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ListTile(
                title: Text(
                  'Description',
                  style: TextStyle(
                      color: Colors.brown.shade800,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      letterSpacing: 1),
                ),
                subtitle: Padding(
                    padding: EdgeInsets.only(top: 15),
                    child: Text(
                      'the user description information information and summry',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Divider(
                  color: Colors.brown.shade600,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                //  _stateManager.submitProfile(ProfileRequest());
                },
                child: Container(
                    alignment: Alignment.center,
                    height: 55,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.brown.shade400,
                        gradient: LinearGradient(
                          colors: [
                            Colors.brown.shade400,
                            Colors.brown.shade200
                          ],
                        ),
                        borderRadius: BorderRadius.circular(30)),
                    child: Text('Save',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white))),
              ),
              SizedBox(
                height: 50,
              )
            ]),
          )),
       //(errorSave == null)?SizedBox.shrink(): _buildAleart(context)
    ]));
  }

  
}

_buildAleart(context){
 return AlertDialog(
   content: Container(width: 100,height: 100,
   child: Text('ssssssssssssssssssssssssssss'),
   ),
   actions: [
     IconButton(icon: Icon(Icons.ac_unit), onPressed: (){
       Navigator.pop(context);
     })
   ],
 );
}
