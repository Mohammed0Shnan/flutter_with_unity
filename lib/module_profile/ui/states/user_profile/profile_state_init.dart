import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tut/module_profile/model/profile_model.dart';
import 'package:tut/module_profile/profile_routes.dart';
import 'package:tut/utils/size_configration/size_config.dart';

class ProfileStateInit extends StatelessWidget {
  
  final Function(String) onImageChange;
  final ProfileModel profileModel ;
  ProfileStateInit({this.profileModel,this.onImageChange});
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      body: Stack(
        children: [
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
            child: ListView(
              shrinkWrap: true,
              children: [
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
               
                _getHeader(context),
                SizedBox(
                  height: 35,
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
                       // profileModel.status,
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
                       // profileModel.description,
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
                  height: 50,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget _getHeader(context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(shape: BoxShape.circle),
              child: Stack(alignment: Alignment.center, children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    shape: BoxShape.circle,
                  ),
                ),
                Container(
                  height: 130,

                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image:
                        DecorationImage(image: AssetImage('assets/person.png')),
                  ),

                  // widget.request == null

                  //     ? Container()

                  //     : widget.request.image == null

                  //         ? Container()

                  //         : Container(

                  //             height: 96,

                  //             decoration: BoxDecoration(

                  //               shape: BoxShape.circle,

                  //               image: DecorationImage(

                  //                   image: NetworkImage(

                  //                       widget.request.image.contains('http')

                  //                           ? widget.request.image

                  //                           : Urls.IMAGES_ROOT +

                  //                               widget.request.image),

                  //                   fit: BoxFit.contain,

                  //                   onError: (e, s) {

                  //                     return AssetImage(

                  //                         'assets/images/logo.png');

                  //                   }),

                  //             ),

                  //           )
                ),
                Positioned(
                    left: -5,
                    bottom: 20,
                    child: IconButton(
                        icon: Icon(
                          Icons.camera,
                          size: 40,
                        ),
                        onPressed: () {
                          ImagePicker()
                              .getImage(source: ImageSource.gallery)
                              .then((value) {
                                onImageChange(value.path);
                            // widget.onImageUpload(

                            //   ProfileRequest(

                            //     userName: _firstNameController.text,

                            //     lastName: _lastNameController.text,

                            //     phone: _phoneController.text,

                            //     location: _locationController.text,

                            //     image: value.path,

                            //   ),

                            // );
                          });
                        }))
              ]),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed(ProfileRoutes.EDIT_PROFILE_SCREEN);
                  }),
              Text(
                //profileModel.name,
                'user name',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}