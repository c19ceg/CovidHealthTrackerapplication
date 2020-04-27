//import 'dart:io';

import 'package:flutter/material.dart';
//import 'package:rflutter_alert/rflutter_alert.dart';
import 'Login.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'auth.dart';

class Signup extends StatelessWidget {
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
          'SIGN UP',
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
  final _auth = FirebaseAuth.instance;
  String email;
  String password;
  String error;
  String info;
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
                    hintText: 'EmailId',
                    hintStyle: TextStyle(color: Colors.white),
                    labelText: 'Enter your mail id',
                    labelStyle: TextStyle(color: Colors.white)),
                validator:(email){
                  Pattern pattern =
                      r'^([a-z0-9_\-\.]+)@([a-z.]+)\.([a-z]{2,5})$';
                  RegExp regex = new RegExp(pattern);
                  if (!regex.hasMatch(email))
                    return 'Invalid username';
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
                    hintText: 'Password',
                    hintStyle: TextStyle(color: Colors.white),
                    labelText: 'Enter Your Password',
                    labelStyle: TextStyle(color: Colors.white)),
                validator:(password){
                  Pattern pattern =
                      r'^[ A-Za-z0-9]+(?:[ _-][A-Za-z0-9]+)*$';
                  RegExp regex = new RegExp(pattern);
                  if (!regex.hasMatch(password)   )
                    {
                     // if(password.length<6)
                        return 'Invalid password/\npassword is less than 6 character';

                  }
                  else
                    return null;
                },
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20.0, top: 50.0),
              child: RaisedButton(
                onPressed: () async {
                  dynamic newUser;
                  if(_formKey.currentState.validate()) {
                    try {
                      newUser = await _auth.createUserWithEmailAndPassword(
                          email: email, password: password);}
                    catch (e) {
                      print(e);
                      newUser=null;
                      String i=e.toString();
                      final startindex = i.indexOf('(');
                      final finalindex = i.indexOf(',');
                      info = i.substring(startindex,finalindex);

                    }

                      if (newUser != null) {
                         showDialog(
                            context: context,
                            builder: (BuildContext context) {
    // return object of type Dialog
                              return AlertDialog(
                                 title: new Text("Message"),
                                 content: new Text("Successfully Registered"),
                                 actions: <Widget>[
    // usually buttons at the bottom of the dialog
                                  new FlatButton(
                                 child: new Text("Ok"),
                                  onPressed: () {
                                   Navigator.of(context).pop();},),
                                 ],);},);

                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Login()));
                      }

                      else if(info == "(ERROR_NETWORK_REQUEST_FAILED")
                      {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            // return object of type Dialog
                            return AlertDialog(
                              title: new Text("Message"),
                              content: new Text("Poor Network Connection"),
                              actions: <Widget>[
                                // usually buttons at the bottom of the dialog
                                new FlatButton(
                                  child: new Text("ok"),
                                  onPressed: () {
                                    Navigator.of(context).pop();},),
                              ],);},);

                      }

                      else if(info == "(ERROR_EMAIL_ALREADY_IN_USE")
                      {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            // return object of type Dialog
                            return AlertDialog(
                              title: new Text("Message"),
                              content: new Text("Email Already in Use"),
                              actions: <Widget>[
                                // usually buttons at the bottom of the dialog
                                new FlatButton(
                                  child: new Text("ok"),
                                  onPressed: () {
                                    Navigator.of(context).pop();},),
                              ],);},);

                      }


                      else
                        {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              // return object of type Dialog
                              return AlertDialog(
                                title: new Text("Message"),
                                content: new Text("Invalid Credential/password should be greater than 6 character"),
                                actions: <Widget>[
                                  // usually buttons at the bottom of the dialog
                                  new FlatButton(
                                    child: new Text("Ok"),
                                    onPressed: () {
                                      Navigator.of(context).pop();},),
                                ],);},);
                        }

                  }
                },
                child: Text('Sign In',style: TextStyle(fontSize: 20.0,),),
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
