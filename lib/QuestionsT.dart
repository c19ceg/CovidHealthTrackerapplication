//import 'package:covid/Dashboard.dart';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'dart:math';
import 'DashboardT.dart';

class QuestionsT extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[700],
      appBar: AppBar(
        title: Text("சுயமதிப்பீடு"),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
      ),

      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            background(),
            Formdetails(),
          ],
        ),
      ),
    );
  }
}


class background extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Image.asset('assets/background1.jpg',),
        ],
      ),
    );
  }

}


class Formdetails extends StatefulWidget {
  @override
  _FormdetailsState createState() => _FormdetailsState();
}

class _FormdetailsState extends State<Formdetails> {
  final _fs = Firestore.instance;
  FirebaseUser fbuser;
  String userName;
  double value;
  bool checkvalue=false;





  @override
  void initState() {
    super.initState();
    getUser();
  }

  void getUser() async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        fbuser = user;
        userName = fbuser.email;
      }
    } catch (e) {
      print(e);
    }
  }

  final _formKey = GlobalKey<FormState>();

  final _auth = FirebaseAuth.instance;

  List<String> question = ['Qn1', 'Qn2', 'Qn3', 'Qn4', 'Qn5'];
  String ans1, ans2, ans3, ans4;
  String qn1 = 'Travelled out in past 30days?';
  String qn2 = 'Willing to volunteer when needed?';
  String qn3 = 'Do you have any health issues?';
  String qn4 = 'Willing to take 20 seconds selftesting?';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10.0),
              child: TextFormField(
                onChanged: (val) {
                  ans1 = val;
                },
                decoration: const InputDecoration(
                    hintText: 'பயண வரலாறு',
                    hintStyle: TextStyle(color: Colors.white),
                    labelText: 'கடந்த 30 நாட்களில் பயணம் செய்தீர்களா?',
                    labelStyle: TextStyle(color: Colors.white)),
                validator:(ans1){

                  if (ans1.isEmpty)
                    return 'தவறான பதில்';
                  else
                    return null;

                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: TextFormField(
                onChanged: (val) {
                  ans2 = val;
                },
                decoration: const InputDecoration(
                    hintText: 'ஆம்/இல்லை',
                    hintStyle: TextStyle(color: Colors.white),
                    labelText: 'தேவைப்படும்போது உதவுகிறீர்களா?',
                    labelStyle: TextStyle(color: Colors.white)),

                validator:(ans2){
                  if (ans2!="ஆம்" && ans2!="இல்லை")
                    return 'தவறான பதில் வகை:ஆம்/இல்லை';
                  else
                    return null;

                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: TextFormField(
                onChanged: (val) {
                  ans3 = val;
                },
                decoration: const InputDecoration(
                    hintText: 'தனிப்பட்ட ஆரோக்கியம்',
                    hintStyle: TextStyle(color: Colors.white),
                    labelText: 'உங்கள் உடல்நலம் எப்படி உள்ளது?',
                    labelStyle: TextStyle(color: Colors.white)),
                validator:(ans3){

                  if (ans3.isEmpty)
                    return 'தவறான பதில்';
                  else
                    return null;

                },
              ),
            ),

            Container(
              padding: EdgeInsets.all(10.0),
              child: TextFormField(
                onChanged: (val) {
                  ans4 = val;
                },
                decoration: const InputDecoration(
                    hintText: 'ஆம்/இல்லை',
                    hintStyle: TextStyle(color: Colors.white),
                    labelText: '20 நொடி சோதனைக்கு தயாரா?',
                    labelStyle: TextStyle(color: Colors.white)),
                validator:(ans2){
                  if (ans2!="ஆம்" && ans2!="இல்லை")
                    return 'தவறான பதில் வகை:ஆம்/இல்லை';
                  else
                    return null;

                },
              ),
            ),

            Container(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  children: <Widget>[
                    Checkbox(value: checkvalue, onChanged:(bool value){
                      setState(() {
                        checkvalue=value;
                      });
                    }),
                    SizedBox(height: 30.0,),
                    Text("மேலே உள்ள தகவலை\n"
                        " இதன்மூலம் உறுதிப்படுத்துகிறேன்"
                      ,style: TextStyle(color: Colors.black,fontSize: 13.0,fontWeight:FontWeight.bold,),overflow: TextOverflow.ellipsis,),
                  ],
                )
            ),



            Container(
              padding: EdgeInsets.only(left: 100.0, top: 50.0),
              child: RaisedButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    if (checkvalue == true) {
                      Scaffold.of(context)
                          .showSnackBar(
                          SnackBar(content: Text('தரவு செயலாக்கத்தில் உள்ளது.')));
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => DashboardT()));
                    }
                    else {
                      Scaffold.of(context)
                          .showSnackBar(
                          SnackBar(content: Text('உங்கள் செயலை உறுதிப்படுத்தவும்.')));
                    }

                  }

                  _fs.collection('info').add({
                    'email': userName,
                    qn1: ans1,
                    qn2: ans2,
                    qn3: ans3,
                    qn4: ans4
                  });

                },
                child: Text(
                  'தொடரவும்',
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

