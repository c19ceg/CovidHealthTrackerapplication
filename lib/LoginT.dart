//import 'package:covid/Dashboard.dart';
import 'package:flutter/material.dart';
//import 'package:frontend1db/auth.dart';
import 'InfoT.dart';


//import 'package:firebase_auth/firebase_auth.dart';



class LoginT extends StatelessWidget {
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
          'பயனர் உள்நுழைவு',
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
  //final AuthService _auth = AuthService();
  String email;
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
                  email = val;
                },
                decoration: const InputDecoration(
                    icon: Icon(Icons.person, color: Colors.black, size: 40.0),
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
                    return 'தவறான கடவுச்சொல் \n ​​கடவுச்சொல் 6 எழுத்துகளுக்கு குறைவாக உள்ளது';
                  else
                    return null;
                },
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20.0,top: 50.0),
              child: RaisedButton(
                child: Text('உள்நுழைய', style: TextStyle(fontSize: 20.0,),),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),),


                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    /*dynamic newUser;
                    //DB validation
                    try {
                      newUser = await _auth.signInWithEmailAndPassword(
                          email: email, password: password);
                    }
                    catch(e)
                    {newUser=null;
                    print(e);
                    }
                    if (newUser != null) {*/
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        // return object of type Dialog
                        return AlertDialog(
                          title: new Text("செய்தி"),
                          content: new Text("உள்நுழைந்துள்ளீர் \n$email",),
                          actions: <Widget>[
                            // usually buttons at the bottom of the dialog
                            new FlatButton(
                              child: new Text("சரி"),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },),
                          ],);
                      },);

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => InfoT()),
                    );
                  }

                  /*   else {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          // return object of type Dialog
                          return AlertDialog(
                            title: new Text("செய்தி"),
                            content: new Text("மன்னிக்கவும் \n$email இல்லை"),
                            actions: <Widget>[
                              // usually buttons at the bottom of the dialog
                              new FlatButton(
                                child: new Text("சரி"),
                                onPressed: () {
                                  Navigator.of(context).pop();},),
                            ],);},);
                    }*/
                }
              ),
            ),
          ],
        ),
      ),
    );
  }
}



