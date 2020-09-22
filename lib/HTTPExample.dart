import 'package:flutter/material.dart';
import 'package:http/http.dart';

class HTTPExample extends StatefulWidget
{
  HTTPExampleState createState()=> HTTPExampleState();
}

class HTTPExampleState extends State<HTTPExample>{

  String LOGTAG="HTTPExample";
  String responseMsg="Welcome to Thingsup!!!";


  void request() async
  {
    String url = "https://api.thingsup.io/data/<AccountID>/<RuleID>";

    Map<String, String> headers = {
      "Content-type": "application/json",
      "Authorization": "Bearer test"
    };

    String inputJson = '{"temperature":30}';
    Response response = await post(url, headers: headers, body: inputJson);

    setState(()
    {
      responseMsg=responseMsg+"\n\$:->Response: "+response.body.toString();
    });

  }


  @override
  Widget build(BuildContext context) {



    return Scaffold(
      resizeToAvoidBottomPadding: true,
      appBar: AppBar(title: Text("HTTP Example"),),
      body: new Column(
        children: <Widget>[


          Flexible(
            flex: 5,
            fit: FlexFit.tight,
            child:  new Container(
              margin:EdgeInsets.fromLTRB(10, 10, 10, 10),
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              width: MediaQuery.of(context).size.width,
              color: Colors.black,
              child:  new Expanded(
                //flex: 1,
                child: new SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: new Text(responseMsg,
                    style: new TextStyle(
                      fontSize: 16.0, color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: new Container(
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: <Widget>[

                  Flexible(
                    flex: 1,
                    child:  new RaisedButton(
                      onPressed: () {
                        request();
                      },
                      child: const Text('Send', style: TextStyle(fontSize: 17,color: Colors.blue,fontWeight: FontWeight.normal),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),

    );
  }
}