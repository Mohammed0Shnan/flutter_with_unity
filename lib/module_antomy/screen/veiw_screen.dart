import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_unity_widget/flutter_unity_widget.dart';

class ViewScreen extends StatefulWidget {
  @override
  _ViewScreenState createState() => _ViewScreenState();
}

class _ViewScreenState extends State<ViewScreen> {
  UnityWidgetController _unityWidgetController;

  get onUnityMessage => null;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: UnityWidget(
      onUnityViewCreated: onUnityCreated,
      isARScene: true,
    )));
  }

  void onUnityCreated(controller) {
    this._unityWidgetController = controller;
  }
}
