import 'package:flutter/material.dart';
import 'chatScreen.dart';
import 'powerOptionsScreen.dart';
import 'trackComputerScreen.dart';

class GetStartedScreen extends StatelessWidget {
  static String routeName = '/getStared';
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          stops: [0.1, 0.5, 0.7, 0.9],
          colors: [
            Colors.green[500],
            Colors.green[400],
            Colors.green[300],
            Colors.green[200],


          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text('Getting Started'),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(20),
                child: Text('What you want me to do ?',style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black
                ),),
              ),
              InkWell(
                onTap: () {
                 Navigator.of(context).pushNamed(ChatScreen.routeName);
                },
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Center(
                      child: Text('Give Instructions to your computer',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.white
                      ),),),
                  margin: EdgeInsets.all(20),
                  width: 250,
                  height: 150,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      stops: [0.1, 0.5, 0.7, 0.9],
                      colors: [
                        Colors.purple[500],
                        Colors.purple[400],
                        Colors.purple[300],
                        Colors.purple[200],


                      ],
                    ),
                    borderRadius: BorderRadius.circular(30),

                  ),

                ),
              ),
              InkWell(
                onTap: () {
                 Navigator.of(context).pushNamed(PowerOptionsScreen.routeName);
                },
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Center(
                    child: Text('Power Options',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                          color: Colors.white,
                      ),),),
                  margin: EdgeInsets.all(20),
                  width: 250,
                  height: 150,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      stops: [0.1, 0.5, 0.7, 0.9],
                      colors: [
                        Colors.orange[500],
                        Colors.orange[400],
                        Colors.orange[300],
                        Colors.orange[200],


                      ],
                    ),
                    borderRadius: BorderRadius.circular(30),

                  ),

                ),
              ),
              InkWell(
                onTap: () {
                 Navigator.of(context).pushNamed(TrackScreen.routeName);
                },
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Center(
                    child: Text('Track your computer',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                          color: Colors.white,
                      ),),),
                  margin: EdgeInsets.all(20),
                  width: 250,
                  height: 150,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      stops: [0.1, 0.5, 0.7, 0.9],
                      colors: [
                        Colors.red[500],
                        Colors.red[400],
                        Colors.red[300],
                        Colors.red[200],


                      ],
                    ),
                    borderRadius: BorderRadius.circular(30),

                  ),

                ),
              ),

            ],
          ),
        )
      ),
    );
  }
}
