import 'package:flutter/material.dart';

class HelpScreen extends StatelessWidget {
  static String routeName = '/help';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('What is it all about?'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Center(
        child: Text('This is help page'),
      ),
    );
  }
}
