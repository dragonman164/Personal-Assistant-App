import 'package:flutter/material.dart';
import 'package:personal_assistant_app/screens/getStartedScreen.dart';
import 'screens/homeScreen.dart';
import 'screens/helpScreen.dart';
import 'screens/chatScreen.dart';
import 'screens/powerOptionsScreen.dart';
import 'screens/trackComputerScreen.dart';

void main(){
  runApp(PersonalAssistant());
}

class PersonalAssistant extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.purpleAccent,
      ),

      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName :(context)=>HomeScreen(),
        HelpScreen.routeName:(context)=>HelpScreen(),
        GetStartedScreen.routeName:(context)=>GetStartedScreen(),
        ChatScreen.routeName : (context)=>ChatScreen(),
        PowerOptionsScreen.routeName:(context)=>PowerOptionsScreen(),
        TrackScreen.routeName:(context)=>TrackScreen(),
      },
    );
  }
}

