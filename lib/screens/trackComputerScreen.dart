import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class TrackScreen extends StatelessWidget {
  static String routeName = '/trackDetails';
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
          title: Text('Track your computer'),
        ),
        body: Column(
          children: [
          DataTable(columns: [
                DataColumn(label: Text('Device',style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),)),
                DataColumn(label: Text('Usage (In Percentage)',style: TextStyle(
                    color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),)),

              ], rows: [
                DataRow(
                  cells: [
                    DataCell(Text('CPU Usage',style: TextStyle(
                      color: Colors.white,
                    ),)),
                    DataCell(Text('20 %',style: TextStyle(
                      color: Colors.white,
                    ),))
                  ]
                ),
            DataRow(
                cells: [
                  DataCell(Text('RAM Usage',style: TextStyle(
                    color: Colors.white,
                  ),)),
                  DataCell(Text('20 %',style: TextStyle(
                    color: Colors.white,
                  ),))
                ]
            ),
            DataRow(
                cells: [
                  DataCell(Text('Disk Usage',style: TextStyle(
                    color: Colors.white,
                  ),)),
                  DataCell(Text('20 %',style: TextStyle(
                    color: Colors.white,
                  ),))
                ]
            ),
              ],decoration: BoxDecoration(
                color: Colors.black,
                border: Border.all(color: Colors.white,width: 3),
              ),),
          SizedBox(height: 20,),
          Container(
            margin: EdgeInsets.all(20),
            child: Text('Click on the refresh button to fetch latest data',style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),),
          ),
            InkWell(
              onTap: () {
                print("Taking a Picture from WebCam");
              },
              child: Container(
              width: 200,
                height: 50,
                child: Center(child: Text('Click here to take a picture',style:
                  TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),),),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.yellow,width: 4),
                  color: Colors.indigo,
                ),
              ),
            ),
            SizedBox(height: 20,),
            CircularPercentIndicator(radius: 200,
            backgroundColor: Colors.red,
            lineWidth: 20,
            percent: 0.2,
            center: Container(
              margin: EdgeInsets.all(40),
              child: Column(
                children: [
                  Icon(Icons.battery_full),
                  Text('Battery Indicator',style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),),
                ],
              ),
            ),
            progressColor: Colors.green,)
          ],

        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.orange,
          child: Icon(Icons.refresh,color: Colors.indigo,),
          onPressed: () {
           print("This button was pressed");
          },
        ),
      ),
    );
  }
}
