import 'package:flutter/material.dart';

class HelpScreen extends StatelessWidget {
  static String routeName = '/help';
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
        image: AssetImage('assets/help_background.jpg'),
        fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text('What is it all about?'),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: Container(
          color : Colors.white,
          margin: EdgeInsets.only(top: 20,left: 20,right: 20,bottom: 250),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(20),
                child: Text('What is your Personal Assistant App?',style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),textAlign: TextAlign.center,),
              ),
              Container(
                margin: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text('1. It is a complete system to control your system using remote device or microphone.',style: TextStyle(
                      fontSize: 17,
                    ),textAlign: TextAlign.center,),
                    SizedBox(height: 20,),
                    Text('2. You can either use your remote device or personal computer to control your PC.',style: TextStyle(
                      fontSize: 17,
                    ),textAlign: TextAlign.center,),
                    SizedBox(height: 20,),
                    Text('3. You can also track your device anywhere around the world, and give it desired instructions remotely.',style: TextStyle(
                      fontSize: 17,
                    ),textAlign: TextAlign.center,),
                  ],

                )
              ),

            ],
          ),
        )
      ),
    );
  }
}
