import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tut/module_auth/model/app_user.dart';
import 'package:tut/module_auth/ui/widget/header.dart';

class RegisterInitState extends StatefulWidget {
  final AppUser user;
  final Function(AppUser) onSignUpRequest;
  RegisterInitState({this.user, this.onSignUpRequest});

  @override
  _RegisterInitStateState createState() => _RegisterInitStateState(
        fullName: user == null
            ? null
            : user.fullName == null
                ? ''
                : user.fullName,
        email: user == null
            ? null
            : user.email == null
                ? ''
                : user.email,
        password: user == null
            ? null
            : user.password == null
                ? ''
                : user.password,
        confirmPassword: user == null
            ? null
            : user.confirmPassword == null
                ? ''
                : user.confirmPassword,
      );
}

class _RegisterInitStateState extends State<RegisterInitState> {
  TextEditingController _fullName;
  TextEditingController _email;
  TextEditingController _password;
  TextEditingController _confirmPassword;

  _RegisterInitStateState({fullName, email, password, confirmPassword}) {
    _fullName = TextEditingController(text: fullName);
    _email = TextEditingController(text: email);
    _password = TextEditingController(text: password);
    _confirmPassword = TextEditingController(text: confirmPassword);
  }

  bool acceptTerm = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Header(text: "Sign Up",),
          SizedBox(
            height: 20,
          ),
          Form(
              child: Container(
            margin: EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: [
                TextField(
                  controller: _fullName,
                  style: TextStyle(fontSize: 19, height: 1),
                  decoration: InputDecoration(
                      labelText: 'FullName',
                      labelStyle: TextStyle(
                          color: Colors.brown,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                      suffixIcon: Icon(
                        Icons.person,
                        color: Colors.brown,
                        size: 26,
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 10)),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _email,
                  style: TextStyle(fontSize: 19, height: 1),
                  decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(
                          color: Colors.brown,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                      suffixIcon: Icon(
                        Icons.email,
                        color: Colors.brown,
                        size: 26,
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 10)),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _password,
                  style: TextStyle(fontSize: 19, height: 1),
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(
                          color: Colors.brown,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                      suffixIcon: Icon(
                        Icons.vpn_key,
                        color: Colors.brown,
                        size: 26,
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 10)),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _confirmPassword,
                  style: TextStyle(fontSize: 19, height: 1),
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: 'Confirm Password',
                      labelStyle: TextStyle(
                          color: Colors.brown,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                      suffixIcon: Icon(
                        Icons.vpn_key,
                        color: Colors.brown,
                        size: 26,
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 10)),
                ),
              ],
            ),
          )),
          SizedBox(
            height: 15,
          ),
          Container(
            padding: EdgeInsets.only(left: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          acceptTerm = !acceptTerm;
                        });
                      },
                      child: Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                            color: Colors.brown.shade400,
                            shape: BoxShape.circle),
                        child: (acceptTerm)
                            ? Icon(
                                Icons.check,
                                color: Colors.white,
                              )
                            : null,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: RichText(
                          text: TextSpan(
                              style: TextStyle(
                                  color: Colors.brown.shade400, fontSize: 19),
                              children: [
                            TextSpan(text: 'i accept '),
                            TextSpan(text: 'Terms'),
                            TextSpan(text: 'of use'),
                            TextSpan(text: ' privacy policy'),
                          ])),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 50,
                    ),
                    Text(
                      'Do you have an account?',
                      style:
                          TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Login',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 50,
                    ),
                    Text(
                      'Sign Uup as ',
                      style:
                          TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'guest',
                      style:
                          TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    AppUser appUser = AppUser(
                        fullName: _fullName.text,
                        email: _email.text,
                        password: _password.text,
                        confirmPassword: _confirmPassword.text);
                    widget.onSignUpRequest(appUser);
                  },
                  child: Container(
                      alignment: Alignment.center,
                      height: 55,
                      width: 150,
                      decoration: BoxDecoration(
                          color: Colors.brown.shade400,
                          gradient: LinearGradient(
                            colors: [
                              Colors.brown.shade400,
                              Colors.brown.shade200
                            ],
                          ),
                          borderRadius: BorderRadius.circular(30)),
                      child: Text('Sign Up',
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white))),
                ),
                SizedBox(
                  height: 30,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

