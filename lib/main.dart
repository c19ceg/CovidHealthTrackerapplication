//import 'package:covid/login.dart';
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Login.dart';
import 'Signup.dart';
import 'mainT.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:// Column(
        //children: <Widget>[
          Splashscreen(),
         // FirstPage(),
       // ],
     // ),
    );
  }
}

class Splashscreen extends StatefulWidget {
  @override
  _SplashscreenState createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {

  @override
  void initState() {

    super.initState();
    Future.delayed(Duration(seconds: 5),(){print("hi");
      Navigator.push(
        context, MaterialPageRoute(
        builder: (context) => FirstPage()
      )
      );
     },
    );
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'TRACK-O-METER',
            style: TextStyle(fontSize: 20.0),
          ),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
      color: Colors.black,
           ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 100.0,),
              Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/giphy.gif'),
                        radius: 200.0,
                      )
                    ] ,
                ),
              ),

              Column(mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircularProgressIndicator(),
                  Padding(
                    padding:EdgeInsets.only(top:20.0),
                  ),
                  Text("Follow Social Distancing",style: TextStyle(color: Colors.white,fontSize: 18.0,fontWeight:FontWeight.bold),)
                ],
              )

            ],
          )
        ],
      ),

    );
  }
}

/*void call()
{print("hi");
  Widget build(BuildContext context) {
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: //Column(
      //children: <Widget>[
     // Splashscreen(),

      FirstPage(),
      // ],
      //),
    );
  }
}*/







class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("hi");
    return Container(
      child: Center(
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'TRACK-O-METER',
              style: TextStyle(fontSize: 20.0),
            ),
            centerTitle: true,
            backgroundColor: Colors.blue[900],
          ),
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/background1.jpg'),
                  fit: BoxFit.cover),
            ),
            child: button(),
          ),
        ),
      ),
    );
  }
}

class button extends StatefulWidget {
  @override
  _buttonState createState() => _buttonState();
}

class _buttonState extends State<button> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'WELCOME,User\n',
            style: TextStyle(
              fontSize: 40.0,
              fontWeight: FontWeight.bold,
              color: Colors.blue[100],
            ),
          ),
          Text('New user?', style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold, color: Colors.blue[100],),),
          Text("create an account:",style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, color: Colors.blue[100],),),

          SizedBox(height: 10.0),
          RaisedButton(
            child: Text(
              'Sign Up',
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Signup()));
            },
          ),
          SizedBox(height: 30.0),
          Text('Existing User?', style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold, color: Colors.blue[100],),),
          Text("login:",style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, color: Colors.blue[100],),),

          SizedBox(height: 10.0),
          RaisedButton(
            child: Text(
              'Log In',
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Login()));
            },
          ),

          Container(

            child: Column(
              children: <Widget>[
                SizedBox(width: 0.0,height: 20.0,),
                Text("பயன்பாட்டு மொழியை மாற்ற:",style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, color: Colors.blue[100],),),

                    RaisedButton(
                      child: Text("தமிழ்",style: TextStyle(fontSize: 20.0,),),

                      onPressed: (){
                        this.setState((){
                          Navigator.push(
                              context, MaterialPageRoute(builder: (context) => MyAppT()));
                        });
                      },
                    ),
                  ],
                ),

            ),
           ],
          ),
      );
  }
}
