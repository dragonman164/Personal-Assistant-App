import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void displayDialog (BuildContext context,String url)
{
  showDialog(context:context,builder: (_)=>Dialog(
    child: Container(
      width: 400,
      height: 300,
      child: Image(
        image: NetworkImage(url),
      )
    ),
  ));

}




class TrackScreen extends StatefulWidget {
  static String routeName = '/trackDetails';

  @override
  _TrackScreenState createState() => _TrackScreenState();
}

class _TrackScreenState extends State<TrackScreen> {

  Map <String,double> data = {
    "Battery":20,
    "CPU":20,
    "RAM":20,
    "Disk":20,
  };

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
                    DataCell(Text(data["CPU"].toString(),style: TextStyle(
                      color: Colors.white,
                    ),))
                  ]
                ),
            DataRow(
                cells: [
                  DataCell(Text('RAM Usage',style: TextStyle(
                    color: Colors.white,
                  ),)),
                  DataCell(Text(data["RAM"].toString(),style: TextStyle(
                    color: Colors.white,
                  ),))
                ]
            ),
            DataRow(
                cells: [
                  DataCell(Text('Disk Usage',style: TextStyle(
                    color: Colors.white,
                  ),)),
                  DataCell(Text(data["Disk"].toString(),style: TextStyle(
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
              onTap: () async{
                var check,url = "http://192.168.1.6:8000/media/";
                var headers = {
                  'Content-Type': 'application/json',
                  'Authorization': 'Basic YWRtaW46YWRtaW4='
                };
                var request = http.MultipartRequest('GET', Uri.parse('http://192.168.1.6:8000/api3/'));
                request.fields.addAll({
                  'query': 'photo'
                });

                request.headers.addAll(headers);

                http.StreamedResponse response = await request.send();

                if (response.statusCode == 200) {
                  check = await response.stream.bytesToString();
                  check = jsonDecode(check);
                 url += check["file"].substring(7,check["file"].length);
                }
                else {
                print(response.reasonPhrase);
                }
                displayDialog(context,url);



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
            percent: data["Battery"]/100,
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
          onPressed: () async{

            try{var headers = {
              'Content-Type': 'application/json',
              'Authorization': 'Basic YWRtaW46YWRtaW4='
            };
            var request = await http.get('http://192.168.1.6:8000/api2/',headers: headers);
            var new_data = jsonDecode(request.body);
             data["Battery"] = new_data["battery_percentage"].toDouble();
             data["CPU"] = new_data["cpu_usage"].toDouble();
             data["RAM"] = new_data["ram_usage"].toDouble();
             data["Disk"] = new_data["disk_usage"].toDouble();
  setState(() {

  });}catch(e)
            {
              print("Error");
            }
             },
        ),
      ),
    );
  }
}
