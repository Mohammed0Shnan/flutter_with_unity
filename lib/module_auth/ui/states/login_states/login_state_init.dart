import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tut/module_auth/model/app_user.dart';
import 'package:tut/module_auth/request/login_request/login_request.dart';
import 'package:tut/module_auth/ui/widget/header.dart';

class LoginInitState extends StatefulWidget {
  final AppUser user;
  final Function(LoginRequest) onLoginRequest;
  LoginInitState({this.user, this.onLoginRequest});

  @override
  _LoginInitStateState createState() => _LoginInitStateState();
}

class _LoginInitStateState extends State<LoginInitState> {
  TextEditingController _email;
  TextEditingController _password;

  _LoginInitStateState({fullName, email, password, confirmPassword}) {
    _email = TextEditingController(text: email);
    _password = TextEditingController(text: password);
  }

  bool acceptTerm = false;

  bool keepMe = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Header(
            text: "Login",
          ),
          SizedBox(
            height: 20,
          ),
          Form(
              child: Container(
            margin: EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: [
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                      checkColor: Colors.white,
                      activeColor: Colors.brown.shade400,
                      onChanged: (bool value) {
                        setState(() {
                          keepMe = value;
                        });
                      },
                      value: keepMe,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      'Keep me signed in',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    LoginRequest request = LoginRequest(
                        email: _email.text, password: _password.text);

                    widget.onLoginRequest(request);
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
                      child: Text('Login',
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
