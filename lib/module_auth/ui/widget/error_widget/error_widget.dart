import 'package:flutter/material.dart';

class ErrorWiget extends StatelessWidget {
  final Map<String, dynamic> data;
  ErrorWiget({this.data});
  @override
  Widget build(BuildContext context) {
    return Container(
      child:Center(child: Text('Error State !!!'),)
    );
  }
}
