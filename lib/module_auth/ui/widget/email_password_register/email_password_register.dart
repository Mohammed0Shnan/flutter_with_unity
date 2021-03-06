
import 'package:flutter/material.dart';

class EmailPasswordRegisterForm extends StatefulWidget {
  final Function(String, String, String) onRegisterRequest;

  EmailPasswordRegisterForm({
    this.onRegisterRequest,
  });

  @override
  State<StatefulWidget> createState() => _EmailPasswordRegisterFormState();
}

class _EmailPasswordRegisterFormState extends State<EmailPasswordRegisterForm> {
  final GlobalKey<FormState> _registerFormKey = GlobalKey<FormState>();
  final TextEditingController _registerNameController = TextEditingController();
  final TextEditingController _registerEmailController =
      TextEditingController();
  final TextEditingController _registerPasswordController =
      TextEditingController();

  bool loading = false;

  @override
  void initState() {
    loading = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);
    Future.delayed(Duration(seconds: 30), () {
      loading = false;
      if (mounted) setState(() {});
    });
    if (mounted) setState(() {});
    return SingleChildScrollView(
      child: Form(
        key: _registerFormKey,
        autovalidateMode: AutovalidateMode.always,
        child: Flex(
          direction: Axis.vertical,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Flex(
              direction: Axis.vertical,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.black
                            : Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 2.0,
                            spreadRadius: 2.0,
                            offset: Offset(
                              5.0, // horizontal, move right 10
                              5.0, // vertical, move down 10
                            ),
                          )
                        ]),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: TextFormField(
                        controller: _registerNameController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          labelText: 'Name'//S.of(context).name,
                        ),
                        textInputAction: TextInputAction.next,
                        onEditingComplete: () => node.nextFocus(),
                        // Move focus to next
                        validator: (result) {
                          if (result.isEmpty) {
                            return 'Name is required';//S.of(context).nameIsRequired;
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.black
                            : Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 2.0,
                            // has the effect of softening the shadow
                            spreadRadius: 2.0,
                            // has the effect of extending the shadow
                            offset: Offset(
                              5.0, // horizontal, move right 10
                              5.0, // vertical, move down 10
                            ),
                          )
                        ]),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: TextFormField(
                        controller: _registerEmailController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          labelText:'Email'// S.of(context).email,
                        ),
                        textInputAction: TextInputAction.next,
                        onEditingComplete: () => node.nextFocus(),
                        // Move focus to next
                        validator: (result) {
                          if (result.isEmpty) {
                            return 'Email Address is Required';//S.of(context).emailAddressIsRequired;
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.black
                            : Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 2.0,
                            // has the effect of softening the shadow
                            spreadRadius: 2.0,
                            // has the effect of extending the shadow
                            offset: Offset(
                              5.0, // horizontal, move right 10
                              5.0, // vertical, move down 10
                            ),
                          )
                        ]),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: TextFormField(
                        controller: _registerPasswordController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          labelText:'Password'// S.of(context).password,
                        ),
                        validator: (result) {
                          if (result.length < 5) {
                            return '';
                          }
                          return null;
                        },
                        obscureText: true,
                        textInputAction: TextInputAction.done,
                        onFieldSubmitted: (_) =>
                            node.unfocus(), // Submit and hide keyboard
                      ),
                    ),
                  ),
                ),
              ],
            ),
            loading == true
                ? Text('Loading'//S.of(context).loading
                )
                : Flex(
                    direction: Axis.vertical,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: GestureDetector(
                          onTap: () {
                            // Navigator.of(context).push(MaterialPageRoute(
                            //   builder: (context)=>
                            //   LoginScreen(LoginStateManager(AuthService(AuthPrefsHelper(),AuthManager(AuthRepository(ApiClient())))))
                            // ));
                          },
                          child: Text(
                            'I have an account',//S.of(context).iHaveAnAccount,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: FlatButton(
                          padding: const EdgeInsets.all(16.0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16)),
                          color: Theme.of(context).primaryColor,
                          onPressed: () {
                            if (_registerFormKey.currentState.validate()) {
                              loading = true;
                              setState(() {});
                              widget.onRegisterRequest(
                                _registerEmailController.text.trim(),
                                _registerPasswordController.text.trim(),
                                _registerNameController.text.trim(),
                              );
                            }
                          },
                          child: Text(
                           'Next',// S.of(context).next,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
          ],
        ),
      ),
    );
  }
}
