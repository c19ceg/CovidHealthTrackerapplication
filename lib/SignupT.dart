//import 'dart:io';

import 'package:flutter/material.dart';
import 'package:frontend1db/LoginT.dart';
//import 'package:rflutter_alert/rflutter_alert.dart';
import 'LoginT.dart';
//import 'package:firebase_auth/firebase_auth.dart';
//import 'auth.dart';

class SignupT extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FullScreenPage(),
    );
  }
}

class FullScreenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'பதிவுசெய்க',
        ),
        backgroundColor: Colors.blue[900],
        centerTitle: true,
      ),
      resizeToAvoidBottomPadding: false,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/background1.jpg'), fit: BoxFit.cover),
        ),
        child: Home(),
      ),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //final _auth = FirebaseAuth.instance;
  String email;
  String password;
  String error;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Form(
        key: _formKey,
        child: Column(
          ///crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20.0),
              child: TextFormField(
                onChanged: (val) {
                  email = val;
                },
                decoration: const InputDecoration(
                    icon: Icon(Icons.alternate_email, color: Colors.black, size: 40.0),
                    hintText: 'அஞ்சல் ஐடி',
                    hintStyle: TextStyle(color: Colors.white),
                    labelText: 'உங்கள் அஞ்சல் ஐடி',
                    labelStyle: TextStyle(color: Colors.white)),
                validator:(email){
                  Pattern pattern =
                      r'^([a-z0-9_\-\.]+)@([a-z.]+)\.([a-z]{2,5})$';
                  RegExp regex = new RegExp(pattern);
                  if (!regex.hasMatch(email))
                    return 'தவறான அஞ்சல் ஐடி';
                  else
                    return null;

                },
              ),
            ),

            Container(
              padding: EdgeInsets.all(20.0),
              child: TextFormField(
                onChanged: (val) {
                  password = val;
                },
                obscureText: true,
                decoration: const InputDecoration(
                    icon: Icon(
                      Icons.work,
                      color: Colors.black,
                      size: 40.0,
                    ),
                    hintText: 'கடவுச்சொல்',
                    hintStyle: TextStyle(color: Colors.white),
                    labelText: 'கடவுச்சொல்லை உள்ளிடவும்',
                    labelStyle: TextStyle(color: Colors.white)),
                validator:(password){
                  if (password.length<6)
                    return 'தவறான கடவுச்சொல் \n ​​கடவுச்சொல் 6 எழுத்துகளுக்கு\nகுறைவாக உள்ளது';
                  else
                    return null;
                },
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20.0, top: 50.0),
              child: RaisedButton(
                onPressed: ()  {
                  if(_formKey.currentState.validate()) {
                    /*dynamic newUser;
                  }
                    try {
                      newUser = await _auth.createUserWithEmailAndPassword(
                          email: email, password: password);}
                    catch (e) {
                      newUser=null;
                      print(e);

                    }

                    if (newUser != null) {*/
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          // return object of type Dialog
                          return AlertDialog(
                          title: new Text("செய்தி"),
                            content: new Text("வெற்றிகரமாக பதிவு செய்யப்பட்டது"),
                            actions: <Widget>[
                              // usually buttons at the bottom of the dialog
                              new FlatButton(
                                child: new Text("சரி"),
                                onPressed: () {
                                  Navigator.of(context).pop();},),
                            ],);},);

                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginT()));

                  /*  else
                    {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          // return object of type Dialog
                          return AlertDialog(
                            title: new Text("செய்தி"),
                            content: new Text("தவறான தரவு\n கடவுச்சொல் 6 எழுத்துகளுக்கு மேல் இருக்க வேண்டும்"),
                            actions: <Widget>[
                              // usually buttons at the bottom of the dialog
                              new FlatButton(
                                child: new Text("சரி"),
                                onPressed: () {
                                  Navigator.of(context).pop();},),
                            ],);},);
                    }*/

                  }
                },
                child: Text('உள்நுழைக',style: TextStyle(fontSize: 20.0,),),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),


            //  SizedBox(height: 12.0,),
            //  Text(error,
            //     style: TextStyle(color: Colors.red, fontSize: 14.0))

          ],
        ),
      ),
    );
  }
}
