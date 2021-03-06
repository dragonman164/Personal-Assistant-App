import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


Widget MessageWidget(String data)
{
  return  Container(
    margin: EdgeInsets.only(left: 30,top: 30,bottom: 20),
    width: 280,
    height: 50,
    child: Center(child: Text(data,
      style: TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.bold,
      ),),),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.only(bottomRight: Radius.elliptical(20,20)),
      color: Colors.lightGreen,
    ),
  );
}

List <Widget>messagesSent = [
 MessageWidget('This is a test Message'),
];

class ChatScreen extends StatefulWidget {

  static String routeName = '/chatScreen';

  @override
  _ChatScreenState createState() => _ChatScreenState();
}



class _ChatScreenState extends State<ChatScreen> {

  TextEditingController query;

  @override
  void initState() {
    // TODO: implement initState
    query = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    query.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/chatbackground.png'),
          fit: BoxFit.fitHeight,
        )
      ),
      child: Scaffold(
    backgroundColor: Colors.transparent,
        appBar: AppBar(
      title: Text('Give Instructions'),
        ),
        body: Container(
          width: 400,
          height: 530,
          child: SingleChildScrollView(
            child: Column(
              children: messagesSent,
            ),
          ),
        ),
        floatingActionButton: Container(
          margin: EdgeInsets.all(15),
          width: 400,
          height: 60,
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.only(left: 20),
                  child: TextField(
                    controller: query,
                    decoration: InputDecoration(
                      labelText: 'Type your Message here',
                      border: InputBorder.none,
                    ),
                  ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.grey[400],
                ),
                width:260,
              ),
              SizedBox(width: 10,),
              FloatingActionButton(
                onPressed: () async{
                  if(query.value.text!= null)
                   {
                     var headers = {
                       'Content-Type': 'application/json',
                       'Authorization': 'Basic YWRtaW46YWRtaW4='
                     };
                     var request = http.MultipartRequest('POST', Uri.parse('http://192.168.1.6:8000/api1/'));
                     request.fields.addAll({
                       'query': query.value.text
                     });

                     request.headers.addAll(headers);

                     http.StreamedResponse response = await request.send();

                     if (response.statusCode == 200) {
                       print(await response.stream.bytesToString());
                  }
                  else {
                  print(response.reasonPhrase);
                  }

                  }
                 setState(() {
                   messagesSent.add(MessageWidget(query.value.text));
                 });
                },
                child: Icon(Icons.send),
              )
            ],
          ),
        )
      ),
    );
  }
}
