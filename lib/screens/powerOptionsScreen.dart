import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

bool displayDialog (BuildContext context)
{
  showDialog(context:context,builder: (_)=>Dialog(
    child: Container(
      width: 200,
      height: 200,
      child: Container(
        child: Column(
          children: [
            Container(
              child: Text('Are you sure?',style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),),
              margin: EdgeInsets.all(20),
            ),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    margin: EdgeInsets.all(30),
                    height: 50,
                    width: 70,
                    child: Center(child: Text("Yes",style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20,
                    ),)),
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.yellow,width: 5)
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                   Navigator.of(context).pop();
                  },
                  child: Container(
                    margin: EdgeInsets.all(30),
                    height: 50,
                    width: 70,
                    child: Center(child: Text("No",style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20,
                    ),)),
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.yellow,width: 5)
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    ),
  ));
  return true;
}



class PowerOptionsScreen extends StatelessWidget {
  static String routeName = '/powerOptions';
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
            title: Text('Power Options'),
            backgroundColor: Theme.of(context).primaryColor,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(20),
                  child: Text('Power Settings',style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                  ),),
                ),
                InkWell(
                  onTap: () async{
                    bool ans = displayDialog(context);
                    var headers = {
                      'Content-Type': 'application/json',
                      'Authorization': 'Basic YWRtaW46YWRtaW4='
                    };
                    var request = http.MultipartRequest('POST', Uri.parse('http://192.168.1.6:8000/api1/'));
                    request.fields.addAll({
                      'query': 'shutdown',
                    });

                    request.headers.addAll(headers);

                    http.StreamedResponse response = await request.send();

                    if (response.statusCode == 200) {
                      print(await response.stream.bytesToString());
                    }
                    else {
                    print(response.reasonPhrase);
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: Center(
                      child: Column(
                        children: [
                          Icon(Icons.power_settings_new,color: Colors.white,size: 60,),
                          Text('Shutdown',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                color: Colors.white
                            ),),
                        ],
                      ),),
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
                InkWell(
                  onTap: () async{
                    bool ans = displayDialog(context);
                    var headers = {
                      'Content-Type': 'application/json',
                      'Authorization': 'Basic YWRtaW46YWRtaW4='
                    };
                    var request = http.MultipartRequest('POST', Uri.parse('http://192.168.1.6:8000/api1/'));
                    request.fields.addAll({
                      'query': 'restart',
                    });

                    request.headers.addAll(headers);

                    http.StreamedResponse response = await request.send();

                    if (response.statusCode == 200) {
                      print(await response.stream.bytesToString());
                    }
                    else {
                    print(response.reasonPhrase);
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: Center(
                      child: Column(
                        children: [
                          Icon(Icons.refresh,color: Colors.white,size: 60,),
                          Text('Reboot',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: Colors.white,
                            ),),
                        ],
                      ),),
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
                  onTap: () async{
                    bool ans = displayDialog(context);
                    var headers = {
                      'Content-Type': 'application/json',
                      'Authorization': 'Basic YWRtaW46YWRtaW4='
                    };
                    var request = http.MultipartRequest('POST', Uri.parse('http://192.168.1.6:8000/api1/'));
                    request.fields.addAll({
                      'query': 'logout',
                    });

                    request.headers.addAll(headers);

                    http.StreamedResponse response = await request.send();

                    if (response.statusCode == 200) {
                      print(await response.stream.bytesToString());
                    }
                    else {
                    print(response.reasonPhrase);
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: Center(
                      child: Column(

                        children: [
                          Icon(Icons.lock,color: Colors.white,size: 60,),
                          Text('Log out',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: Colors.white,
                            ),),
                        ],
                      ),),
                    margin: EdgeInsets.all(20),
                    width: 250,
                    height: 150,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        stops: [0.1, 0.5, 0.7, 0.9],
                        colors: [
                          Colors.indigo[500],
                          Colors.indigo[400],
                          Colors.indigo[300],
                          Colors.indigo[200],


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
