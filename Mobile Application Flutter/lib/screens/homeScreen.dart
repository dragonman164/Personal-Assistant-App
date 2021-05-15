import 'package:flutter/material.dart';
import 'helpScreen.dart';
import 'getStartedScreen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  static String routeName = '/';
 

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool loading = false;
  
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
          title: Text('Personal Assistant'),
          backgroundColor: Theme.of(context).primaryColor
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                child: Image(image: AssetImage('assets/assistant.jpg'),
                width: 500,),
              margin: EdgeInsets.all(30),
              decoration: BoxDecoration(

                border: Border.all(color: Colors.redAccent,width: 10),
              ),
            ),
            Text('Welcome to your Personal Assistant',
                textAlign:TextAlign.center,style:
            TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
            )),
                Center(
                  child: Container(
                    margin: EdgeInsets.all(20),
                    width: 200,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.deepOrange,
                      border: Border.all(color: Colors.purple,width: 3),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ListTile(
                      leading: Icon(Icons.record_voice_over,size: 30,),
                      title: Text('Get Started',style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 18,
                      ),),
                      onTap: () async{
                        loading = true;
                        var headers = {
                          'Content-Type': 'application/json',
                          'Authorization': 'Basic YWRtaW46YWRtaW4='
                        };
                        var request = http.MultipartRequest('POST', Uri.parse('http://192.168.1.6:8000/api4/'));
                        request.fields.addAll({
                          'mobile': 'true'
                        });
                        request.headers.addAll(headers);
                        http.StreamedResponse response = await request.send();
                        if (response.statusCode == 200) {
                          print(await response.stream.bytesToString());
                        }
                        else {
                          print(response.reasonPhrase);
                        }
                        loading = false;
                        setState(() {});
                      Navigator.of(context).pushNamed(GetStartedScreen.routeName);
                      },
                    ),
                  ),
                ),
            Center(
              child: Container(
                margin: EdgeInsets.all(20),
                width: 200,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.orangeAccent,
                  border: Border.all(color: Colors.purple,width: 3),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ListTile(
                  leading: Icon(Icons.help,size: 30,color: Colors.blue,),
                  title: Text('How this App Works?',style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 18,
                  ),),
                  onTap: () {

                    Navigator.of(context).pushNamed(HelpScreen.routeName);
                  },
                ),
              ),
            ),
            loading?SpinKitCubeGrid(
              color: Colors.purple,
              size: 50,
            ):Text('')

          ],
        )
      ),
    );
  }
}
