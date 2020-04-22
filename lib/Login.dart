//import 'package:covid/Dashboard.dart';
import 'package:flutter/material.dart';
import 'Info.dart';
//import 'package:firebase_auth/firebase_auth.dart';



class Login extends StatelessWidget {
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
          'USER LOGIN',
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
  // final _auth = FirebaseAuth.instance;
  String name;
  String password;
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
                  name = val;
                },
                decoration: const InputDecoration(
                    icon: Icon(Icons.person, color: Colors.black, size: 40.0),
                    hintText: 'Username/EmailId :',
                    hintStyle: TextStyle(color: Colors.white),
                    labelText: 'Enter Username/EmailId:',
                    labelStyle: TextStyle(color: Colors.white)),
                validator:(name){
                  Pattern pattern =
                      r'^[ A-Za-z]+(?:[ _-][A-Za-z]+)*$';
                  RegExp regex = new RegExp(pattern);
                  if (!regex.hasMatch(name))
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
                    hintText: 'Password::',
                    hintStyle: TextStyle(color: Colors.white),
                    labelText: 'Enter Your Password:',
                    labelStyle: TextStyle(color: Colors.white)),
                validator:(pas){
                  Pattern pattern =
                      r'^[ A-Za-z]+(?:[ _-][A-Za-z]+)*$';
                  RegExp regex = new RegExp(pattern);
                  if (!regex.hasMatch(pas) && pas.length<6 )
                    return 'Invalid password/\npassword is less than 6 character';
                  else
                    return null;
                },
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20.0,top: 50.0),
              child: RaisedButton(
                onPressed: (){
                  if(_formKey.currentState.validate()) {
                    Scaffold.of(context)
                        .showSnackBar(SnackBar(content: Text('Data is in processing.')));
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Info()),
                    );
                  }},

                child: Text('login',
                  style: TextStyle(
                    fontSize: 20.0,),),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),),),
            )
          ],
        ),
      ),
    );
  }
}
