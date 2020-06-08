//import 'package:covid/Dashboard.dart';
import 'dart:ui';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:speech_recognition/speech_recognition.dart';
import 'DashboardT.dart';

class QuestionsT extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[700],
      appBar: AppBar(
        title: Text("சுயமதிப்பீடு"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),

      body:Stack(
          children: <Widget>[
            // background(),
            Container(padding:EdgeInsets.only(top:200.0,left: 60.0),child: SvgPicture.asset('assets/bg6.svg',height: 200.0,)),
            Formdetails(),
          ],
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

var now = DateTime.now();
String sdays = now.add((Duration(days: 7))).toString();
String seventhday = sdays.substring(0,10);


class Formdetails extends StatefulWidget {
  @override
  _FormdetailsState createState() => _FormdetailsState();
}

class _FormdetailsState extends State<Formdetails> {
  final _fs = Firestore.instance;
  final FlutterTts flutterTts = FlutterTts();

  SpeechRecognition _speechRecognition = SpeechRecognition();
  SpeechRecognition _speechRecognition2 = SpeechRecognition();
  SpeechRecognition _speechRecognition3 = SpeechRecognition();
  SpeechRecognition _speechRecognition4 = SpeechRecognition();
  SpeechRecognition _speechRecognition5 = SpeechRecognition();
  SpeechRecognition _speechRecognition6 = SpeechRecognition();
  SpeechRecognition _speechRecognition7 = SpeechRecognition();
  SpeechRecognition _speechRecognition8 = SpeechRecognition();
  SpeechRecognition _speechRecognition9 = SpeechRecognition();
  SpeechRecognition _speechRecognition10 = SpeechRecognition();
  SpeechRecognition _speechRecognition11 = SpeechRecognition();
  SpeechRecognition _speechRecognition12 = SpeechRecognition();
  SpeechRecognition _speechRecognition13 = SpeechRecognition();
  SpeechRecognition _speechRecognition14 = SpeechRecognition();
  SpeechRecognition _speechRecognition15 = SpeechRecognition();
  SpeechRecognition _speechRecognition16 = SpeechRecognition();

  bool _isAvailable = false;
  bool _isListening = false;
  String resultText1 = "";
  String resultText2 = "";
  String resultText3 = "";
  String resultText4 = "";
  String resultText5 = "";
  String resultText6 = "";
  String resultText7 = "";
  String resultText8 = "";
  String resultText9 = "";
  String resultText10 = "";
  String resultText11 = "";
  String resultText12 = "";
  String resultText13 = "";
  String resultText14 = "";
  String resultText15 = "";
  String resultText16 = "";

  FirebaseUser fbuser;
  String userName;
  double value;
  bool checkvalue=false;
  final _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    getUser();
    Future.delayed(Duration(seconds: 2),()
    {
      flutterTts.setLanguage("ta-IN");
      flutterTts.setPitch(1);
      flutterTts.setSpeechRate(1.0);
      flutterTts.speak(
          "இந்த பக்கத்தில், நீங்கள் ,ஆம் அல்லது இல்லை என்று பதிலளிக்க வேண்டும்.");
    }
    );
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



  List<String> question = ['Qn1', 'Qn2', 'Qn3', 'Qn4', 'Qn5','Qn6', 'Qn7', 'Qn8', 'Qn9', 'Qn10','Qn11', 'Qn12','Qn13', 'Qn14','Qn15', 'Qn16'];
  String ans1, ans2, ans3, ans4,ans5, ans6, ans7, ans8,ans9, ans10, ans11, ans12,ans13, ans14,ans15, ans16,a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12,a13,a14,a15,a16;
  String qn1 = 'How is your health?';
  String qn2 = 'Do you have Cough?';
  String qn3 = 'Do you have cold/nose block/running nose?';
  String qn4 = 'Do you have breathlessness?';
  String qn5 = 'Do you have fever?is it responding to paracetamol?';
  String qn6 = 'Do you have generalized body pain?';
  String qn7 = 'Do you have loose motion';
  String qn8 = 'Do you have vomiting?';
  String qn9 = 'Travelled interstate/international in past 30 days?';
  String qn10 = 'Has anyone in your family travelled interstate/international in past 30 days?';
  String qn11 = 'Do you live in hotspot zone?';
  String qn12 = 'Do you work with CIVID19 patients?';
  String qn13 = 'Do you have asthma/respiratory distress/wheezing/TB?';
  String qn14 = 'Do you have Diabetics/Hypertension/History of heart attack/Hich cholestrol?';
  String qn15 = 'Do you have other chronic kidney/liver/lung/heart disease?';
  String qn16 = 'Do you have HIV/AIDS ?/Taking any medication reducing immunity?';


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

              Container(
                  padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 20.0),
                  margin: EdgeInsets.only(top:0.0,bottom: 65.0,left:0.0,right: 0.0),
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.7),
                      border: Border.all(width: 1.0,color: Colors.white),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20.0),
                        bottomLeft: Radius.circular(20.0),
                        // bottomRight: Radius.circular(20.0),
                      )
                  ),
                  child:Center(child: Text("சுவாச அறிகுறிகள்",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),))
              ),

              Container(
                //padding: EdgeInsets.all(20.0),
                padding: EdgeInsets.symmetric(horizontal: 15.0,vertical: 10.0),
                margin: EdgeInsets.only(top:0.0,bottom: 70.0,right:70.0),

                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.7),
                  border: Border.all(width: 1.0,color: Colors.black87),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20.0),
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0),
                  ),
                ),
                child: Container(
                  child: Column(
                    children: <Widget>[
                      TextFormField(

                       onChanged: (val) {
                         a1 = val;
                       },
                        decoration: const InputDecoration(
                            hintText: 'தனிப்பட்ட ஆரோக்கியம்',
                            hintStyle: TextStyle(color: Colors.black),
                            labelText: 'உடல்நலம் எப்படி உள்ளது?',
                            labelStyle: TextStyle(color: Colors.black)),
                          validator:(a1){
                            print("1:$resultText1");
                            ans1 = a1;
                            if (ans1.isEmpty) {
                              if (resultText1.isEmpty)
                                return 'தவறான பதில் ';
                              else{
                                print(resultText1);
                                ans1=resultText1;
                                print("ans1:$ans1");
                                return null;
                              }
                            }
                            else {
                              print("1ans1:$ans1");
                              return null;
                            }
                          }
                      ),
                      Container(
                        child: Row(
                          children: <Widget>[
                            IconButton(

                              icon: Icon(Icons.record_voice_over,color: Colors.black,),
                              onPressed: (){
                                flutterTts.setLanguage("ta-IN");
                                flutterTts.setPitch(1);
                                flutterTts.speak("உங்கள் உடல்நலம் எப்படி உள்ளது?");
                              },
                            ),
                            IconButton(

                              icon: Icon(Icons.mic,color: Colors.black,),
                              onPressed: (){
                                _speechRecognition.setAvailabilityHandler((bool result)=>
                                    setState(() => _isAvailable = result));

                                _speechRecognition.setRecognitionStartedHandler(()=>
                                    setState(() => _isListening = true));

                                _speechRecognition.setRecognitionResultHandler((String speech)=>
                                    setState(() => resultText1 = speech ));

                                _speechRecognition.setRecognitionCompleteHandler(()=>
                                    setState(() => _isListening = false));

                                _speechRecognition.activate().then((result)=>
                                    setState(() => _isAvailable = result));
                                if(_isAvailable && !_isListening)
                                  _speechRecognition.listen(locale: "ta_IN").then((result) => print(":::$result"));
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.mic_off,color: Colors.black,),
                              onPressed: (){
                                _speechRecognition.setAvailabilityHandler((bool result)=>
                                    setState(() => _isAvailable = result));

                                _speechRecognition.setRecognitionStartedHandler(()=>
                                    setState(() => _isListening = true));

                                _speechRecognition.setRecognitionResultHandler((String speech)=>
                                    setState(() => resultText1 = speech ));

                                _speechRecognition.setRecognitionCompleteHandler(()=>
                                    setState(() => _isListening = false));

                                _speechRecognition.activate().then((result)=>
                                    setState(() => _isAvailable = result));
                                if(_isListening)
                                  _speechRecognition.stop().then((result) => setState(() => _isListening = result));
                            },
                            ),
                            Text(resultText1),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Container(

                padding: EdgeInsets.symmetric(horizontal: 25.0,vertical: 10.0),
                margin: EdgeInsets.only(top:0.0,bottom: 65.0,left:10.0),
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.7),
                    border: Border.all(width: 1.0,color: Colors.black),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      bottomLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0),
                    )
                ),
                child:  Column(
                  children: <Widget>[
                    TextFormField(
                      onChanged: (val) {
                        a2 = val;
                       // print(a2);
                      },
                      decoration: const InputDecoration(
                          hintText: 'ஆம் என்றால் உலர்ந்த/கபையுடன்',
                          hintStyle: TextStyle(color: Colors.black),
                          contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: .0),
                          labelText: 'உங்களுக்கு இருமல் இருக்கிறதா?',
                          labelStyle: TextStyle(color: Colors.black)),
                      validator:(a2){
                       // print(resultText2);
                        ans2 = a2;
                        if (ans2.isEmpty) {
                          if (resultText2.isEmpty)
                            return 'தவறான பதில் ';
                          else{
                            print(resultText2);
                            ans2=resultText2;
                            print("ans2:$ans2");
                            return null;
                          }
                        }
                        else {
                          print("1ans2:$ans2");
                          return null;
                        }
                      }
                    ),
                    Container(
                      child: Row(
                        children: <Widget>[
                          IconButton(
                            icon: Icon(Icons.record_voice_over,color: Colors.black,),
                            onPressed: (){
                              flutterTts.setLanguage("ta-IN");
                              flutterTts.setPitch(1);
                              flutterTts.speak("உங்களுக்கு இருமல் இருக்கிறதா?ஆம் என்றால் உலர்ந்ததா அல்லது கபத்துடன்?");
                            },
                          ),
                          IconButton(

                            icon: Icon(Icons.mic,color: Colors.black,),
                            onPressed: (){
                              _speechRecognition2.setAvailabilityHandler((bool result)=>
                                  setState(() => _isAvailable = result));

                              _speechRecognition2.setRecognitionStartedHandler(()=>
                                  setState(() => _isListening = true));

                              _speechRecognition2.setRecognitionResultHandler((String speech)=>
                                  setState(() => resultText2 = speech ));

                              _speechRecognition2.setRecognitionCompleteHandler(()=>
                                  setState(() => _isListening = false));

                              _speechRecognition2.activate().then((result)=>
                                  setState(() => _isAvailable = result));
                              if(_isAvailable && !_isListening)
                                _speechRecognition2.listen(locale: "en_US").then((result) => print(":::$result"));
                            },
                          ),
                          IconButton(

                            icon: Icon(Icons.mic_off,color: Colors.black,),
                            onPressed: (){
                              _speechRecognition2.setAvailabilityHandler((bool result)=>
                                  setState(() => _isAvailable = result));

                              _speechRecognition2.setRecognitionStartedHandler(()=>
                                  setState(() => _isListening = true));

                              _speechRecognition2.setRecognitionResultHandler((String speech)=>
                                  setState(() => resultText2 = speech ));

                              _speechRecognition2.setRecognitionCompleteHandler(()=>
                                  setState(() => _isListening = false));

                              _speechRecognition2.activate().then((result)=>
                                  setState(() => _isAvailable = result));
                              if(_isListening)
                                _speechRecognition2.stop().then((result) => setState(() => _isListening = result));
                              //ans2=resultText2;
                              //print("ans2 $ans2");
                          },
                          ),
                          Text(resultText2),
                        ],
                      ),
                    ),
                  ],
                ),
              ),


              Container(
                //padding: EdgeInsets.all(20.0),
                padding: EdgeInsets.symmetric(horizontal: 5.0,vertical: 10.0),
                margin: EdgeInsets.only(top:0.0,bottom: 70.0,right:5.0),

                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.7),
                  border: Border.all(width: 1.0,color: Colors.black87),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20.0),
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0),
                  ),
                ),
                child: Container(
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        onChanged: (val) {
                          a3 = val;
                        },
                        decoration: const InputDecoration(

                            hintText: 'குளிர்/மூக்கு தடுப்பு/மூக்கு ஒழுகுதல்',
                            hintStyle: TextStyle(color: Colors.black),
                            labelText: 'குளிர்/மூக்கு தடுப்பு/மூக்கு ஒழுகுதல்?',
                            labelStyle: TextStyle(color: Colors.black)),
                          validator:(a3){
                            // print(resultText2);
                            ans3 = a3;
                            if (ans3.isEmpty) {
                              if (resultText3.isEmpty)
                                return 'தவறான பதில் ';
                              else{
                                print(resultText3);
                                ans3=resultText3;
                                print("ans3:$ans3");
                                return null;
                              }
                            }
                            else {
                              print("1ans3:$ans3");
                              return null;
                            }
                          }
                      ),
                      Container(
                       // padding:EdgeInsets.symmetric(horizontal: 80.0),
                        child: Row(
                          children: <Widget>[
                            IconButton(
                              icon: Icon(Icons.record_voice_over,color: Colors.black,),
                              onPressed: (){
                                flutterTts.setLanguage("ta-IN");
                                flutterTts.setPitch(1);
                                flutterTts.speak("உங்களுக்கு குளிர் அல்லது மூக்கு தடுப்பு அல்லது மூக்கு ஒழுகுதல் இருக்கிறதா?");
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.mic,color: Colors.black,),
                              onPressed: (){
                                _speechRecognition3.setAvailabilityHandler((bool result)=>
                                    setState(() => _isAvailable = result));

                                _speechRecognition3.setRecognitionStartedHandler(()=>
                                    setState(() => _isListening = true));

                                _speechRecognition3.setRecognitionResultHandler((String speech)=>
                                    setState(() => resultText3 = speech ));

                                _speechRecognition3.setRecognitionCompleteHandler(()=>
                                    setState(() => _isListening = false));

                                _speechRecognition3.activate().then((result)=>
                                    setState(() => _isAvailable = result));
                                if(_isAvailable && !_isListening)
                                  _speechRecognition3.listen(locale: "en_US").then((result) => print(":::$result"));
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.mic_off,color: Colors.black,),
                              onPressed: (){
                                _speechRecognition3.setAvailabilityHandler((bool result)=>
                                    setState(() => _isAvailable = result));

                                _speechRecognition3.setRecognitionStartedHandler(()=>
                                    setState(() => _isListening = true));

                                _speechRecognition3.setRecognitionResultHandler((String speech)=>
                                    setState(() => resultText3 = speech ));

                                _speechRecognition3.setRecognitionCompleteHandler(()=>
                                    setState(() => _isListening = false));

                                _speechRecognition3.activate().then((result)=>
                                    setState(() => _isAvailable = result));
                                if(_isListening)
                                  _speechRecognition3.stop().then((result) => setState(() => _isListening = result));
                                },
                            ),
                            Text(resultText3)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 25.0,vertical: 10.0),
                margin: EdgeInsets.only(top:0.0,bottom: 65.0,left:20.0),
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.7),
                    border: Border.all(width: 1.0,color: Colors.black),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      bottomLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0),
                    )
                ),
                child: Container(
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        onChanged: (val) {
                          a4 = val;
                        },
                        decoration: const InputDecoration(
                            hintText: 'மூச்சுத் திணறல்',
                            hintStyle: TextStyle(color: Colors.black),
                            labelText: 'மூச்சுத் திணறல் இருக்கிறதா?',
                            labelStyle: TextStyle(color: Colors.black)),
                          validator:(a4){
                            // print(resultText2);
                            ans4 = a4;
                            if (ans4.isEmpty) {
                              if (resultText4.isEmpty)
                                return 'தவறான பதில் ';
                              else{
                                print(resultText4);
                                ans4=resultText4;
                                print("ans4:$ans4");
                                return null;
                              }
                            }
                            else {
                              print("1ans4:$ans4");
                              return null;
                            }
                          }
                      ),
                      Container(
                        child: Row(
                          children: <Widget>[
                            IconButton(

                              icon: Icon(Icons.record_voice_over,color: Colors.black,),
                              onPressed: (){
                                flutterTts.setLanguage("ta-IN");
                                flutterTts.setPitch(1);
                                flutterTts.speak("உங்களுக்கு மூச்சுத் திணறல் இருக்கிறதா?");
                              },
                            ),
                            IconButton(

                              icon: Icon(Icons.mic,color: Colors.black,),
                              onPressed: (){
                                _speechRecognition4.setAvailabilityHandler((bool result)=>
                                    setState(() => _isAvailable = result));

                                _speechRecognition4.setRecognitionStartedHandler(()=>
                                    setState(() => _isListening = true));

                                _speechRecognition4.setRecognitionResultHandler((String speech)=>
                                    setState(() => resultText4 = speech ));

                                _speechRecognition4.setRecognitionCompleteHandler(()=>
                                    setState(() => _isListening = false));

                                _speechRecognition4.activate().then((result)=>
                                    setState(() => _isAvailable = result));
                                if(_isAvailable && !_isListening)
                                  _speechRecognition4.listen(locale: "en_US").then((result) => print(":::$result"));
                              },
                            ),
                            IconButton(

                              icon: Icon(Icons.mic_off,color: Colors.black,),
                              onPressed: (){
                                _speechRecognition4.setAvailabilityHandler((bool result)=>
                                    setState(() => _isAvailable = result));

                                _speechRecognition4.setRecognitionStartedHandler(()=>
                                    setState(() => _isListening = true));

                                _speechRecognition4.setRecognitionResultHandler((String speech)=>
                                    setState(() => resultText4 = speech ));

                                _speechRecognition4.setRecognitionCompleteHandler(()=>
                                    setState(() => _isListening = false));

                                _speechRecognition4.activate().then((result)=>
                                    setState(() => _isAvailable = result));
                                if(_isListening)
                                  _speechRecognition4.stop().then((result) => setState(() => _isListening = result));
                                //ans4=resultText;
                                //print("ans4 $ans4");
                              },
                            ),
                            Text(resultText4),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Container(
                  padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 20.0),
                  margin: EdgeInsets.only(top:0.0,bottom: 65.0,left:0.0,right: 0.0),
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.7),
                      border: Border.all(width: 1.0,color: Colors.white),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20.0),
                        bottomLeft: Radius.circular(20.0),
                        // bottomRight: Radius.circular(20.0),
                      )
                  ),
                  child:Center(child: Text("காய்ச்சல் அறிகுறிகள்:",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),))
              ),

              Container(
                //padding: EdgeInsets.all(20.0),
                padding: EdgeInsets.symmetric(horizontal: 25.0,vertical: 10.0),
                margin: EdgeInsets.only(top:0.0,bottom: 70.0,right:20.0),

                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.7),
                  border: Border.all(width: 1.0,color: Colors.black87),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20.0),
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0),
                  ),
                ),
                child: Container(
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        onChanged: (val) {
                          a5 = val;
                        },
                        decoration: const InputDecoration(

                            hintText: 'பாராசிட்டமால் பதிலளிக்கிறதா?',
                            hintStyle: TextStyle(color: Colors.black),
                            labelText: 'காய்ச்சல் இருக்கிறதா?',
                            labelStyle: TextStyle(color: Colors.black)),
                            validator:(a5){
                              // print(resultText2);
                              ans5 = a5;
                              if (ans5.isEmpty) {
                              if (resultText5.isEmpty)
                              return 'தவறான பதில் ';
                              else{
                              print(resultText5);
                              ans5=resultText5;
                              print("ans5:$ans5");
                              return null;
                              }
                              }
                              else {
                              print("1ans5:$ans5");
                              return null;
                              }
                        }

                      ),
                      Container(
                        child: Row(
                          children: <Widget>[
                            IconButton(

                              icon: Icon(Icons.record_voice_over,color: Colors.black,),
                              onPressed: (){
                                flutterTts.setLanguage("ta-IN");
                                flutterTts.setPitch(1);
                                flutterTts.speak("உங்களுக்கு காய்ச்சல் இருக்கிறதா?இது பாராசிட்டோமலுக்கு பதிலளிக்கிறதா? ");
                              },
                            ),
                            IconButton(

                              icon: Icon(Icons.mic,color: Colors.black,),
                              onPressed: (){
                                _speechRecognition5.setAvailabilityHandler((bool result)=>
                                    setState(() => _isAvailable = result));

                                _speechRecognition5.setRecognitionStartedHandler(()=>
                                    setState(() => _isListening = true));

                                _speechRecognition5.setRecognitionResultHandler((String speech)=>
                                    setState(() => resultText5 = speech ));

                                _speechRecognition5.setRecognitionCompleteHandler(()=>
                                    setState(() => _isListening = false));

                                _speechRecognition5.activate().then((result)=>
                                    setState(() => _isAvailable = result));
                                if(_isAvailable && !_isListening)
                                  _speechRecognition5.listen(locale: "en_US").then((result) => print(":::$result"));
                              },
                            ),
                            IconButton(

                              icon: Icon(Icons.mic_off,color: Colors.black,),
                              onPressed: (){
                                _speechRecognition5.setAvailabilityHandler((bool result)=>
                                    setState(() => _isAvailable = result));

                                _speechRecognition5.setRecognitionStartedHandler(()=>
                                    setState(() => _isListening = true));

                                _speechRecognition5.setRecognitionResultHandler((String speech)=>
                                    setState(() => resultText5 = speech ));

                                _speechRecognition5.setRecognitionCompleteHandler(()=>
                                    setState(() => _isListening = false));

                                _speechRecognition5.activate().then((result)=>
                                    setState(() => _isAvailable = result));
                                if(_isListening)
                                  _speechRecognition5.stop().then((result) => setState(() => _isListening = result));
                               // ans5=resultText;
                                //print("ans5 $ans5");
                                },
                            ),
                            Text(resultText5),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 25.0,vertical: 10.0),
                margin: EdgeInsets.only(top:0.0,bottom: 65.0,left:20.0),
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.7),
                    border: Border.all(width: 1.0,color: Colors.black),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      bottomLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0),
                    )
                ),
                child: Container(
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        onChanged: (val) {
                          a6 = val;
                        },
                        decoration: const InputDecoration(
                            hintText: 'பொதுவான உடல் வலி',
                            hintStyle: TextStyle(color: Colors.black),
                            labelText: 'உடல் வலி இருக்கிறதா?',
                            labelStyle: TextStyle(color: Colors.black)),
                        validator:(a6){// print(resultText2);
                          ans6 = a6;
                          if (ans6.isEmpty) {
                          if (resultText6.isEmpty)
                          return 'தவறான பதில் ';
                          else{
                          print(resultText6);
                          ans6=resultText6;
                          print("ans6:$ans6");
                          return null;
                          }
                          }
                          else {
                          print("1ans6:$ans6");
                          return null;
                          }},
                      ),
                      Container(
                        child: Row(
                          children: <Widget>[
                            IconButton(
                              icon: Icon(Icons.record_voice_over,color: Colors.black,),
                              onPressed: (){
                                flutterTts.setLanguage("ta-IN");
                                flutterTts.setPitch(1);
                                flutterTts.speak("உங்களுக்கு பொதுவான உடல் வலி இருக்கிறதா?");
                              },
                            ),
                            IconButton(

                              icon: Icon(Icons.mic,color: Colors.black,),
                              onPressed: (){
                                _speechRecognition6.setAvailabilityHandler((bool result)=>
                                setState(() => _isAvailable = result));

                                _speechRecognition6.setRecognitionStartedHandler(()=>
                                setState(() => _isListening = true));

                                _speechRecognition6.setRecognitionResultHandler((String speech)=>
                                setState(() => resultText6 = speech ));

                                _speechRecognition6.setRecognitionCompleteHandler(()=>
                                setState(() => _isListening = false));

                                _speechRecognition6.activate().then((result)=>
                                setState(() => _isAvailable = result));
                                if(_isAvailable && !_isListening)
                                  _speechRecognition6.listen(locale: "en_US").then((result) => print(":::$result"));
                              },
                            ),
                            IconButton(

                              icon: Icon(Icons.mic_off,color: Colors.black,),
                              onPressed: (){
                                      _speechRecognition6.setAvailabilityHandler((bool result)=>
                                      setState(() => _isAvailable = result));

                                      _speechRecognition6.setRecognitionStartedHandler(()=>
                                      setState(() => _isListening = true));

                                      _speechRecognition6.setRecognitionResultHandler((String speech)=>
                                      setState(() => resultText6 = speech ));

                                      _speechRecognition6.setRecognitionCompleteHandler(()=>
                                      setState(() => _isListening = false));

                                      _speechRecognition6.activate().then((result)=>
                                      setState(() => _isAvailable = result));
                                      if(_isListening)
                                  _speechRecognition6.stop().then((result) => setState(() => _isListening = result));
                                //ans6=resultText;
                                //print("ans6 $ans6");
                                },
                            ),
                            Text(resultText6),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Container(
                  padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 20.0),
                  margin: EdgeInsets.only(top:0.0,bottom: 65.0,left:0.0,right: 0.0),
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.7),
                      border: Border.all(width: 1.0,color: Colors.white),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20.0),
                        bottomLeft: Radius.circular(20.0),
                        // bottomRight: Radius.circular(20.0),
                      )
                  ),
                  child:Center(child: Text("இரைப்பை குடல் அறிகுறிகள்",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),))
              ),

              Container(
                //padding: EdgeInsets.all(20.0),
                padding: EdgeInsets.symmetric(horizontal: 25.0,vertical: 10.0),
                margin: EdgeInsets.only(top:0.0,bottom: 70.0,right:20.0),

                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.7),
                  border: Border.all(width: 1.0,color: Colors.black87),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20.0),
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0),
                  ),
                ),
                child: Container(
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        onChanged: (val) {
                          a7 = val;
                        },
                        decoration: const InputDecoration(

                            hintText: 'தனிப்பட்ட ஆரோக்கியம்',
                            hintStyle: TextStyle(color: Colors.black),
                            labelText: 'வயிற்றுப்போக்கு இருக்கிறதா?',
                            labelStyle: TextStyle(color: Colors.black)),
                        validator:(a7){// print(resultText2);
                          ans7 = a7;
                          if (ans7.isEmpty) {
                            if (resultText7.isEmpty)
                              return 'தவறான பதில் ';
                            else{
                              print(resultText7);
                              ans7=resultText7;
                              print("ans7:$ans7");
                              return null;
                            }
                          }
                          else {
                            print("1ans7:$ans7");
                            return null;
                          }},
                      ),
                      Container(
                        child: Row(
                          children: <Widget>[
                            IconButton(

                              icon: Icon(Icons.record_voice_over,color: Colors.black,),
                              onPressed: (){
                                flutterTts.setLanguage("ta-IN");
                                flutterTts.setPitch(1);
                                flutterTts.speak("உங்களுக்கு வயிற்றுப்போக்கு இருக்கிறதா?");
                              },
                            ),
                            IconButton(

                              icon: Icon(Icons.mic,color: Colors.black,),
                              onPressed: (){
                                _speechRecognition7.setAvailabilityHandler((bool result)=>
                                    setState(() => _isAvailable = result));

                                _speechRecognition7.setRecognitionStartedHandler(()=>
                                    setState(() => _isListening = true));

                                _speechRecognition7.setRecognitionResultHandler((String speech)=>
                                    setState(() => resultText7 = speech ));

                                _speechRecognition7.setRecognitionCompleteHandler(()=>
                                    setState(() => _isListening = false));

                                _speechRecognition7.activate().then((result)=>
                                    setState(() => _isAvailable = result));
                                if(_isAvailable && !_isListening)
                                  _speechRecognition7.listen(locale: "en_US").then((result) => print(":::$result"));
                              },
                            ),
                            IconButton(

                              icon: Icon(Icons.mic_off,color: Colors.black,),
                              onPressed: (){
                                _speechRecognition7.setAvailabilityHandler((bool result)=>
                                    setState(() => _isAvailable = result));

                                _speechRecognition7.setRecognitionStartedHandler(()=>
                                    setState(() => _isListening = true));

                                _speechRecognition7.setRecognitionResultHandler((String speech)=>
                                    setState(() => resultText7 = speech ));

                                _speechRecognition7.setRecognitionCompleteHandler(()=>
                                    setState(() => _isListening = false));

                                _speechRecognition7.activate().then((result)=>
                                    setState(() => _isAvailable = result));
                                if(_isListening)
                                  _speechRecognition7.stop().then((result) => setState(() => _isListening = result));
                                //ans7=resultText;
                                //print("ans7 $ans7");
                              },
                            ),
                            Text(resultText7),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 25.0,vertical: 10.0),
                margin: EdgeInsets.only(top:0.0,bottom: 65.0,left:20.0),
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.7),
                    border: Border.all(width: 1.0,color: Colors.black),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      bottomLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0),
                    )
                ),
                child: Container(
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        onChanged: (val) {
                          a8 = val;
                        },
                        decoration: const InputDecoration(
                            hintText: 'தனிப்பட்ட ஆரோக்கியம்',
                            hintStyle: TextStyle(color: Colors.black),
                            labelText: 'வாந்தி இருக்கிறதா?',
                            labelStyle: TextStyle(color: Colors.black)),
                        validator:(a8){// print(resultText2);
                          ans8 = a8;
                          if (ans8.isEmpty) {
                            if (resultText8.isEmpty)
                              return 'தவறான பதில் ';
                            else{
                              print(resultText8);
                              ans8=resultText8;
                              print("ans8:$ans8");
                              return null;
                            }
                          }
                          else {
                            print("1ans8:$ans8");
                            return null;
                          }},
                      ),
                      Container(
                        child: Row(
                          children: <Widget>[
                            IconButton(

                              icon: Icon(Icons.record_voice_over,color: Colors.black,),
                              onPressed: (){
                                flutterTts.setLanguage("ta-IN");
                                flutterTts.setPitch(1);
                                flutterTts.speak("உங்களுக்கு வாந்தி இருக்கிறதா?");
                              },
                            ),
                            IconButton(

                              icon: Icon(Icons.mic,color: Colors.black,),
                              onPressed: (){
                                _speechRecognition8.setAvailabilityHandler((bool result)=>
                                    setState(() => _isAvailable = result));

                                _speechRecognition8.setRecognitionStartedHandler(()=>
                                    setState(() => _isListening = true));

                                _speechRecognition8.setRecognitionResultHandler((String speech)=>
                                    setState(() => resultText8 = speech ));

                                _speechRecognition8.setRecognitionCompleteHandler(()=>
                                    setState(() => _isListening = false));

                                _speechRecognition8.activate().then((result)=>
                                    setState(() => _isAvailable = result));
                                if(_isAvailable && !_isListening)
                                  _speechRecognition8.listen(locale: "en_US").then((result) => print(":::$result"));
                              },
                            ),
                            IconButton(

                              icon: Icon(Icons.mic_off,color: Colors.black,),
                              onPressed: (){
                                _speechRecognition8.setAvailabilityHandler((bool result)=>
                                    setState(() => _isAvailable = result));

                                _speechRecognition8.setRecognitionStartedHandler(()=>
                                    setState(() => _isListening = true));

                                _speechRecognition8.setRecognitionResultHandler((String speech)=>
                                    setState(() => resultText8 = speech ));

                                _speechRecognition8.setRecognitionCompleteHandler(()=>
                                    setState(() => _isListening = false));

                                _speechRecognition8.activate().then((result)=>
                                    setState(() => _isAvailable = result));
                                if(_isListening)
                                  _speechRecognition8.stop().then((result) => setState(() => _isListening = result));
                               // ans8=resultText;
                                //print("ans8 $ans8");
                                },
                            ),
                            Text(resultText8),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Container(
                  padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 20.0),
                  margin: EdgeInsets.only(top:0.0,bottom: 65.0,left:0.0,right: 0.0),
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.7),
                      border: Border.all(width: 1.0,color: Colors.white),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20.0),
                        bottomLeft: Radius.circular(20.0),
                        // bottomRight: Radius.circular(20.0),
                      )
                  ),
                  child:Column(
                    children: <Widget>[
                      Center(child: Text("பயணம் / தொடர்பு வரலாறு:",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
                      Center(child: Text("கடந்த 21 நாட்களாக ",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 14.0),)),

                    ],
                  )
              ),

              Container(
                //padding: EdgeInsets.all(20.0),
                padding: EdgeInsets.symmetric(horizontal: 25.0,vertical: 10.0),
                margin: EdgeInsets.only(top:0.0,bottom: 70.0,right:20.0),

                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.7),
                  border: Border.all(width: 1.0,color: Colors.black87),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20.0),
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0),
                  ),
                ),
                child: Container(
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        onChanged: (val) {
                          a9 = val;
                        },
                        decoration: const InputDecoration(

                            hintText: 'பயண வரலாறு',
                            hintStyle: TextStyle(color: Colors.black),
                            labelText: 'உள்ளூர்/சர்வதேச பயணம்?',
                            labelStyle: TextStyle(color: Colors.black)),
                        validator:(a9){// print(resultText2);
                          ans9 = a9;
                          if (ans9.isEmpty) {
                            if (resultText9.isEmpty)
                              return 'தவறான பதில் ';
                            else{
                              print(resultText9);
                              ans9=resultText9;
                              print("ans9:$ans9");
                              return null;
                            }
                          }
                          else {
                            print("1ans9:$ans9");
                            return null;
                          }},
                      ),
                      Container(
                        child: Row(
                          children: <Widget>[
                            IconButton(

                              icon: Icon(Icons.record_voice_over,color: Colors.black,),
                              onPressed: (){
                                flutterTts.setLanguage("ta-IN");
                                flutterTts.setPitch(1);
                                flutterTts.speak("கடந்த 21 நாட்களில் நீங்கள் மாநிலங்களுக்கு அல்லது சர்வதேசத்திற்கு பயணம் செய்தீர்களா?");
                              },
                            ),
                            IconButton(

                              icon: Icon(Icons.mic,color: Colors.black,),
                              onPressed: (){
                                _speechRecognition9.setAvailabilityHandler((bool result)=>
                                    setState(() => _isAvailable = result));

                                _speechRecognition9.setRecognitionStartedHandler(()=>
                                    setState(() => _isListening = true));

                                _speechRecognition9.setRecognitionResultHandler((String speech)=>
                                    setState(() => resultText9 = speech ));

                                _speechRecognition9.setRecognitionCompleteHandler(()=>
                                    setState(() => _isListening = false));

                                _speechRecognition9.activate().then((result)=>
                                    setState(() => _isAvailable = result));
                                if(_isAvailable && !_isListening)
                                  _speechRecognition9.listen(locale: "en_US").then((result) => print(":::$result"));
                              },
                            ),
                            IconButton(

                              icon: Icon(Icons.mic_off,color: Colors.black,),
                              onPressed: (){
                                _speechRecognition9.setAvailabilityHandler((bool result)=>
                                    setState(() => _isAvailable = result));

                                _speechRecognition9.setRecognitionStartedHandler(()=>
                                    setState(() => _isListening = true));

                                _speechRecognition9.setRecognitionResultHandler((String speech)=>
                                    setState(() => resultText9 = speech ));

                                _speechRecognition9.setRecognitionCompleteHandler(()=>
                                    setState(() => _isListening = false));

                                _speechRecognition9.activate().then((result)=>
                                    setState(() => _isAvailable = result));
                                if(_isListening)
                                  _speechRecognition9.stop().then((result) => setState(() => _isListening = result));
                               // ans9=resultText;
                               // print("ans9 $ans9");
                                },
                            ),
                            Text(resultText9),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 15.0,vertical: 10.0),
                margin: EdgeInsets.only(top:0.0,bottom: 65.0,left:10.0),
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.7),
                    border: Border.all(width: 1.0,color: Colors.black),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      bottomLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0),
                    )
                ),
                child: Container(
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        onChanged: (val) {
                          a10 = val;
                        },
                        decoration: const InputDecoration(
                            hintText: 'உள்ளூர் / சர்வதேச பயணம்?',
                            hintStyle: TextStyle(color: Colors.black),
                            labelText: 'குடும்பத்தில் யாராவது இருக்கிறார்களா?',
                            labelStyle: TextStyle(color: Colors.black)),
                        validator:(a10){// print(resultText2);
                          ans10 = a10;
                          if (ans10.isEmpty) {
                            if (resultText10.isEmpty)
                              return 'தவறான பதில் ';
                            else{
                              print(resultText10);
                              ans10=resultText10;
                              print("ans10:$ans10");
                              return null;
                            }
                          }
                          else {
                            print("1ans10:$ans10");
                            return null;
                          }},
                      ),
                      Container(
                        child: Row(
                          children: <Widget>[
                            IconButton(

                              icon: Icon(Icons.record_voice_over,color: Colors.black,),
                              onPressed: (){
                                flutterTts.setLanguage("ta-IN");
                                flutterTts.setPitch(1);
                                flutterTts.speak(" கடந்த 21 நாட்களில் உங்கள் குடும்பத்தில் யாராவது மாநிலங்களுக்கு அல்லது சர்வதேசத்திற்கு பயணம் செய்தார்களா?");
                              },
                            ),
                            IconButton(

                              icon: Icon(Icons.mic,color: Colors.black,),
                              onPressed: (){
                                _speechRecognition10.setAvailabilityHandler((bool result)=>
                                    setState(() => _isAvailable = result));

                                _speechRecognition10.setRecognitionStartedHandler(()=>
                                    setState(() => _isListening = true));

                                _speechRecognition10.setRecognitionResultHandler((String speech)=>
                                    setState(() => resultText10 = speech ));

                                _speechRecognition10.setRecognitionCompleteHandler(()=>
                                    setState(() => _isListening = false));

                                _speechRecognition10.activate().then((result)=>
                                    setState(() => _isAvailable = result));
                                if(_isAvailable && !_isListening)
                                  _speechRecognition10.listen(locale: "en_US").then((result) => print(":::$result"));
                              },
                            ),
                            IconButton(

                              icon: Icon(Icons.mic_off,color: Colors.black,),
                              onPressed: (){
                                _speechRecognition10.setAvailabilityHandler((bool result)=>
                                    setState(() => _isAvailable = result));

                                _speechRecognition10.setRecognitionStartedHandler(()=>
                                    setState(() => _isListening = true));

                                _speechRecognition10.setRecognitionResultHandler((String speech)=>
                                    setState(() => resultText10 = speech ));

                                _speechRecognition10.setRecognitionCompleteHandler(()=>
                                    setState(() => _isListening = false));

                                _speechRecognition10.activate().then((result)=>
                                    setState(() => _isAvailable = result));
                                if(_isListening)
                                  _speechRecognition10.stop().then((result) => setState(() => _isListening = result));
                                //ans10=resultText;
                                //print("ans10 $ans10");
                                },
                            ),
                            Text(resultText10),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Container(
                //padding: EdgeInsets.all(20.0),
                padding: EdgeInsets.symmetric(horizontal: 25.0,vertical: 10.0),
                margin: EdgeInsets.only(top:0.0,bottom: 70.0,right:20.0),

                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.7),
                  border: Border.all(width: 1.0,color: Colors.black87),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20.0),
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0),
                  ),
                ),
                child: Container(
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        onChanged: (val) {
                          a11 = val;
                        },
                        decoration: const InputDecoration(

                            hintText: 'வசிக்கிறீர்களா?',
                            hintStyle: TextStyle(color: Colors.black),
                            labelText: 'ஹாட்ஸ்பாட் மண்டலத்தில் ',
                            labelStyle: TextStyle(color: Colors.black)),
                        validator:(a11){// print(resultText2);
                          ans11 = a11;
                          if (ans11.isEmpty) {
                            if (resultText11.isEmpty)
                              return 'தவறான பதில் ';
                            else{
                              print(resultText11);
                              ans11=resultText11;
                              print("ans11:$ans11");
                              return null;
                            }
                          }
                          else {
                            print("1ans11:$ans11");
                            return null;
                          }},
                      ),
                      Container(
                        child: Row(
                          children: <Widget>[
                            IconButton(
//
                              icon: Icon(Icons.record_voice_over,color: Colors.black,),
                              onPressed: (){
                                flutterTts.setLanguage("ta-IN");
                                flutterTts.setPitch(1);
                                flutterTts.speak(" ஹாட்ஸ்பாட் மண்டலத்தில் வசிக்கிறீர்களா?");
                              },
                            ),
                            IconButton(

                              icon: Icon(Icons.mic,color: Colors.black,),
                              onPressed: (){
                                _speechRecognition11.setAvailabilityHandler((bool result)=>
                                    setState(() => _isAvailable = result));

                                _speechRecognition11.setRecognitionStartedHandler(()=>
                                    setState(() => _isListening = true));

                                _speechRecognition11.setRecognitionResultHandler((String speech)=>
                                    setState(() => resultText11 = speech ));

                                _speechRecognition11.setRecognitionCompleteHandler(()=>
                                    setState(() => _isListening = false));

                                _speechRecognition11.activate().then((result)=>
                                    setState(() => _isAvailable = result));
                                if(_isAvailable && !_isListening)
                                  _speechRecognition11.listen(locale: "en_US").then((result) => print(":::$result"));
                              },
                            ),
                            IconButton(
                              //heroTag: "btn3",
                              //backgroundColor: Colors.white.withOpacity(0.5),
                              //mini: true,
                              icon: Icon(Icons.mic_off,color: Colors.black,),
                              onPressed: (){
                                _speechRecognition11.setAvailabilityHandler((bool result)=>
                                    setState(() => _isAvailable = result));

                                _speechRecognition11.setRecognitionStartedHandler(()=>
                                    setState(() => _isListening = true));

                                _speechRecognition11.setRecognitionResultHandler((String speech)=>
                                    setState(() => resultText11 = speech ));

                                _speechRecognition11.setRecognitionCompleteHandler(()=>
                                    setState(() => _isListening = false));

                                _speechRecognition11.activate().then((result)=>
                                    setState(() => _isAvailable = result));
                                if(_isListening)
                                  _speechRecognition11.stop().then((result) => setState(() => _isListening = result));
                                //ans11=resultText;
                                //print("ans11 $ans11");
                                },
                            ),
                            Text(resultText11),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 15.0,vertical: 10.0),
                margin: EdgeInsets.only(top:0.0,bottom: 65.0,left:10.0),
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.7),
                    border: Border.all(width: 1.0,color: Colors.black),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      bottomLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0),
                    )
                ),
                child: Container(
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        onChanged: (val) {
                          a12 = val;
                        },
                        decoration: const InputDecoration(
                            hintText: 'பயண வரலாறு',
                            hintStyle: TextStyle(color: Colors.black),
                            labelText: 'covid19 நோயாளிகளுடன் தொடர்பு?',
                            labelStyle: TextStyle(color: Colors.black)),
                        validator:(a12){// print(resultText2);
                          ans12 = a12;
                          if (ans12.isEmpty) {
                            if (resultText12.isEmpty)
                              return 'தவறான பதில் ';
                            else{
                              print(resultText12);
                              ans12=resultText12;
                              print("ans12:$ans12");
                              return null;
                            }
                          }
                          else {
                            print("1ans12:$ans12");
                            return null;
                          }},
                      ),
                      Container(
                        child: Row(
                          children: <Widget>[
                            IconButton(

                              icon: Icon(Icons.record_voice_over,color: Colors.black,),
                              onPressed: (){
                                flutterTts.setLanguage("ta-IN");
                                flutterTts.setPitch(1);
                                flutterTts.speak(" நீங்கள் கோவிட் 19 நோயாளிகளுடன் வேலை செய்கிறீர்களா??");
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.mic,color: Colors.black,),
                              onPressed: (){
                                _speechRecognition12.setAvailabilityHandler((bool result)=>
                                    setState(() => _isAvailable = result));

                                _speechRecognition12.setRecognitionStartedHandler(()=>
                                    setState(() => _isListening = true));

                                _speechRecognition12.setRecognitionResultHandler((String speech)=>
                                    setState(() => resultText12 = speech ));

                                _speechRecognition12.setRecognitionCompleteHandler(()=>
                                    setState(() => _isListening = false));

                                _speechRecognition12.activate().then((result)=>
                                    setState(() => _isAvailable = result));
                                if(_isAvailable && !_isListening)
                                  _speechRecognition12.listen(locale: "en_US").then((result) => print(":::$result"));
                              },
                            ),
                            IconButton(
                              //heroTag: "btn3",
                              //backgroundColor: Colors.white.withOpacity(0.5),
                              //mini: true,
                              icon: Icon(Icons.mic_off,color: Colors.black,),
                              onPressed: (){
                                _speechRecognition12.setAvailabilityHandler((bool result)=>
                                    setState(() => _isAvailable = result));

                                _speechRecognition12.setRecognitionStartedHandler(()=>
                                    setState(() => _isListening = true));

                                _speechRecognition12.setRecognitionResultHandler((String speech)=>
                                    setState(() => resultText12 = speech ));

                                _speechRecognition12.setRecognitionCompleteHandler(()=>
                                    setState(() => _isListening = false));

                                _speechRecognition12.activate().then((result)=>
                                    setState(() => _isAvailable = result));
                                if(_isListening)
                                  _speechRecognition12.stop().then((result) => setState(() => _isListening = result));
                                //ans12=resultText;
                                //print("ans12 $ans12");
                                },
                            ),
                            Text(resultText12),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Container(
                  padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 20.0),
                  margin: EdgeInsets.only(top:0.0,bottom: 65.0,left:0.0,right: 0.0),
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.7),
                      border: Border.all(width: 1.0,color: Colors.white),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20.0),
                        bottomLeft: Radius.circular(20.0),
                        // bottomRight: Radius.circular(20.0),
                      )
                  ),
                  child:Column(
                    children: <Widget>[
                      Center(child: Text("இணை நோய்கள்:",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),Padding(
                        padding: EdgeInsets.only(right: 50.0,top: 10.0),
                      ),
                      Text("\tஆமெனில்:\n\t\t\tவழக்கமான மருந்துகள் / ஒழுங்கற்ற மருந்துகள் / மருந்துகள் இல்லை",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),

                    ],
                  )
              ),

              Container(
                //padding: EdgeInsets.all(20.0),
                padding: EdgeInsets.symmetric(horizontal:0.0,vertical: 10.0),
                margin: EdgeInsets.only(top:0.0,bottom: 70.0,right:0.0),

                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.7),
                  border: Border.all(width: 1.0,color: Colors.black87),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20.0),
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0),
                  ),
                ),
                child: Container(
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        onChanged: (val) {
                          a13 = val;
                        },
                        decoration: const InputDecoration(

                            hintText: 'இருக்கிறதா?/இல்லையா?',
                            hintStyle: TextStyle(color: Colors.black),
                            labelText: 'ஆஸ்துமா/சுவாசக் கோளாறு/காசநோய்?',
                            labelStyle: TextStyle(color: Colors.black)),
                        validator:(a13){// print(resultText2);
                          ans13 = a13;
                          if (ans13.isEmpty) {
                            if (resultText13.isEmpty)
                              return 'தவறான பதில் ';
                            else{
                              print(resultText13);
                              ans13=resultText13;
                              print("ans13:$ans13");
                              return null;
                            }
                          }
                          else {
                            print("1ans13:$ans13");
                            return null;
                          }},
                      ),
                      Container(
                        child: Row(
                          children: <Widget>[
                            IconButton(

                              icon: Icon(Icons.record_voice_over,color: Colors.black,),
                              onPressed: (){
                                flutterTts.setLanguage("ta-IN");
                                flutterTts.setPitch(1);
                                flutterTts.speak("உங்களுக்கு ஆஸ்துமா அல்லது சுவாசக் கோளாறு அல்லது மூச்சுத்திணறல் அல்லது காசநோய் இருக்கிறதா?");
                              },
                            ),
                            IconButton(

                              icon: Icon(Icons.mic,color: Colors.black,),
                              onPressed: (){
                                _speechRecognition13.setAvailabilityHandler((bool result)=>
                                    setState(() => _isAvailable = result));

                                _speechRecognition13.setRecognitionStartedHandler(()=>
                                    setState(() => _isListening = true));

                                _speechRecognition13.setRecognitionResultHandler((String speech)=>
                                    setState(() => resultText13 = speech ));

                                _speechRecognition13.setRecognitionCompleteHandler(()=>
                                    setState(() => _isListening = false));

                                _speechRecognition13.activate().then((result)=>
                                    setState(() => _isAvailable = result));
                                if(_isAvailable && !_isListening)
                                  _speechRecognition13.listen(locale: "en_US").then((result) => print(":::$result"));
                              },
                            ),
                            IconButton(
                              //heroTag: "btn3",
                              //backgroundColor: Colors.white.withOpacity(0.5),
                              //mini: true,
                              icon: Icon(Icons.mic_off,color: Colors.black,),
                              onPressed: (){
                                _speechRecognition13.setAvailabilityHandler((bool result)=>
                                    setState(() => _isAvailable = result));

                                _speechRecognition13.setRecognitionStartedHandler(()=>
                                    setState(() => _isListening = true));

                                _speechRecognition13.setRecognitionResultHandler((String speech)=>
                                    setState(() => resultText13 = speech ));

                                _speechRecognition13.setRecognitionCompleteHandler(()=>
                                    setState(() => _isListening = false));

                                _speechRecognition13.activate().then((result)=>
                                    setState(() => _isAvailable = result));
                                if(_isListening)
                                  _speechRecognition13.stop().then((result) => setState(() => _isListening = result));
                                //ans13=resultText;
                                //print("ans13 $ans13");
                                },
                            ),
                            Text(resultText13),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 25.0,vertical: 10.0),
                margin: EdgeInsets.only(top:0.0,bottom: 65.0,left:20.0),
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.7),
                    border: Border.all(width: 1.0,color: Colors.black),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      bottomLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0),
                    )
                ),
                child: Container(
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        onChanged: (val) {
                          a14 = val;
                        },
                        decoration: const InputDecoration(
                            hintText: 'இருக்கிறதா?/இல்லையா?',
                            hintStyle: TextStyle(color: Colors.black),
                            labelText: 'நீரிழிவு/பிபி/கொலஸ்ட்ரால்?',
                            labelStyle: TextStyle(color: Colors.black)),
                        validator:(a14){// print(resultText2);
                          ans14 = a14;
                          if (ans14.isEmpty) {
                            if (resultText14.isEmpty)
                              return 'தவறான பதில் ';
                            else{
                              print(resultText14);
                              ans14=resultText14;
                              print("ans14:$ans14");
                              return null;
                            }
                          }
                          else {
                            print("1ans14:$ans14");
                            return null;
                          }},
                      ),
                      Container(
                        child: Row(
                          children: <Widget>[
                            IconButton(

                              icon: Icon(Icons.record_voice_over,color: Colors.black,),
                              onPressed: (){
                                flutterTts.setLanguage("ta-IN");
                                flutterTts.setPitch(1);
                                flutterTts.speak("உங்களுக்கு நீரிழிவு நோய் அல்லது இரத்த அழுத்தம் அல்லது கொழுப்பு உள்ளதா?");
                              },
                            ),
                            IconButton(

                              icon: Icon(Icons.mic,color: Colors.black,),
                              onPressed: (){
                                _speechRecognition14.setAvailabilityHandler((bool result)=>
                                    setState(() => _isAvailable = result));

                                _speechRecognition14.setRecognitionStartedHandler(()=>
                                    setState(() => _isListening = true));

                                _speechRecognition14.setRecognitionResultHandler((String speech)=>
                                    setState(() => resultText14 = speech ));

                                _speechRecognition14.setRecognitionCompleteHandler(()=>
                                    setState(() => _isListening = false));

                                _speechRecognition14.activate().then((result)=>
                                    setState(() => _isAvailable = result));
                                if(_isAvailable && !_isListening)
                                  _speechRecognition14.listen(locale: "en_US").then((result) => print(":::$result"));
                              },
                            ),
                            IconButton(

                              icon: Icon(Icons.mic_off,color: Colors.black,),
                              onPressed: (){
                                _speechRecognition14.setAvailabilityHandler((bool result)=>
                                    setState(() => _isAvailable = result));

                                _speechRecognition14.setRecognitionStartedHandler(()=>
                                    setState(() => _isListening = true));

                                _speechRecognition14.setRecognitionResultHandler((String speech)=>
                                    setState(() => resultText14 = speech ));

                                _speechRecognition14.setRecognitionCompleteHandler(()=>
                                    setState(() => _isListening = false));

                                _speechRecognition14.activate().then((result)=>
                                    setState(() => _isAvailable = result));
                                if(_isListening)
                                  _speechRecognition14.stop().then((result) => setState(() => _isListening = result));
                                //ans14=resultText;
                                //print("ans14 $ans14");
                                },
                            ),
                            Text(resultText14),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),


              Container(
                //padding: EdgeInsets.all(20.0),
                padding: EdgeInsets.symmetric(horizontal: 25.0,vertical: 10.0),
                margin: EdgeInsets.only(top:0.0,bottom: 70.0,right:20.0),

                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.7),
                  border: Border.all(width: 1.0,color: Colors.black87),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20.0),
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0),
                  ),
                ),
                child: Container(
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        onChanged: (val) {
                          a15 = val;
                        },
                        decoration: const InputDecoration(

                            hintText: 'நோய் இருக்கிறதா?/இல்லையா?',
                            hintStyle: TextStyle(color: Colors.black),
                            labelText: 'சிறுநீரகம்/கல்லீரல்/நுரையீரல்?',
                            labelStyle: TextStyle(color: Colors.black)),
                        validator:(a15){// print(resultText2);
                          ans15 = a15;
                          if (ans15.isEmpty) {
                            if (resultText15.isEmpty)
                              return 'தவறான பதில் ';
                            else{
                              print(resultText15);
                              ans15=resultText15;
                              print("ans15:$ans15");
                              return null;
                            }
                          }
                          else {
                            print("1ans15:$ans15");
                            return null;
                          }},
                      ),
                      Container(
                        child: Row(
                          children: <Widget>[
                            IconButton(

                            icon: Icon(Icons.record_voice_over,color: Colors.black,),
                              onPressed: (){
                                flutterTts.setLanguage("ta-IN");
                                flutterTts.setPitch(1);
                                flutterTts.speak("உங்களுக்கு சிறுநீரகம் அல்லது கல்லீரல் அல்லது நுரையீரல் நோய் இருக்கிறதா?");
                              },
                            ),
                            IconButton(
                              //heroTag: "btn2",
                              // backgroundColor: Colors.white.withOpacity(0.5),
                              //mini: true,
                              icon: Icon(Icons.mic,color: Colors.black,),
                              onPressed: (){
                                _speechRecognition15.setAvailabilityHandler((bool result)=>
                                    setState(() => _isAvailable = result));

                                _speechRecognition15.setRecognitionStartedHandler(()=>
                                    setState(() => _isListening = true));

                                _speechRecognition15.setRecognitionResultHandler((String speech)=>
                                    setState(() => resultText15 = speech ));

                                _speechRecognition15.setRecognitionCompleteHandler(()=>
                                    setState(() => _isListening = false));

                                _speechRecognition15.activate().then((result)=>
                                    setState(() => _isAvailable = result));
                                if(_isAvailable && !_isListening)
                                  _speechRecognition15.listen(locale: "en_US").then((result) => print(":::$result"));
                              },
                            ),
                            IconButton(
                              //heroTag: "btn3",
                              //backgroundColor: Colors.white.withOpacity(0.5),
                              //mini: true,
                              icon: Icon(Icons.mic_off,color: Colors.black,),
                              onPressed: (){
                                _speechRecognition15.setAvailabilityHandler((bool result)=>
                                    setState(() => _isAvailable = result));

                                _speechRecognition15.setRecognitionStartedHandler(()=>
                                    setState(() => _isListening = true));

                                _speechRecognition15.setRecognitionResultHandler((String speech)=>
                                    setState(() => resultText15 = speech ));

                                _speechRecognition15.setRecognitionCompleteHandler(()=>
                                    setState(() => _isListening = false));

                                _speechRecognition15.activate().then((result)=>
                                    setState(() => _isAvailable = result));
                                if(_isListening)
                                  _speechRecognition15.stop().then((result) => setState(() => _isListening = result));
                                //ans15=resultText;
                                //print("ans15 $ans15");
                                },
                            ),
                            Text(resultText15),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),


              Container(
                padding: EdgeInsets.symmetric(horizontal: 25.0,vertical: 10.0),
                margin: EdgeInsets.only(top:0.0,bottom: 65.0,left:20.0),
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.7),
                    border: Border.all(width: 1.0,color: Colors.black),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      bottomLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0),
                    )
                ),
                child: Container(
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        onChanged: (val) {
                          a16 = val;
                        },
                        decoration: const InputDecoration(
                            hintText: 'எடுத்துக் கொள்கிறீர்களா?',
                            hintStyle: TextStyle(color: Colors.black),
                            labelText: 'நோய் எதிர்ப்பு சக்திக்கு மருந்து ',
                            labelStyle: TextStyle(color: Colors.black)),
                        validator:(a16){// print(resultText2);
                          ans16 = a16;
                          if (ans16.isEmpty) {
                            if (resultText16.isEmpty)
                              return 'தவறான பதில் ';
                            else{
                              print(resultText16);
                              ans16=resultText16;
                              print("ans16:$ans16");
                              return null;
                            }
                          }
                          else {
                            print("1ans16:$ans16");
                            return null;
                          }},
                      ),
                      Container(
                        child: Row(
                          children: <Widget>[
                            IconButton(

                              icon: Icon(Icons.record_voice_over,color: Colors.black,),
                              onPressed: (){
                                flutterTts.setLanguage("ta-IN");
                                flutterTts.setPitch(1);
                                flutterTts.speak("நோய் எதிர்ப்பு சக்திக்கு மருந்து எடுத்துக் கொள்கிறீர்களா?");
                              },
                            ),
                            IconButton(
                              //heroTag: "btn2",
                              // backgroundColor: Colors.white.withOpacity(0.5),
                              //mini: true,
                              icon: Icon(Icons.mic,color: Colors.black,),
                              onPressed: (){
                                _speechRecognition16.setAvailabilityHandler((bool result)=>
                                    setState(() => _isAvailable = result));

                                _speechRecognition16.setRecognitionStartedHandler(()=>
                                    setState(() => _isListening = true));

                                _speechRecognition16.setRecognitionResultHandler((String speech)=>
                                    setState(() => resultText16 = speech ));

                                _speechRecognition16.setRecognitionCompleteHandler(()=>
                                    setState(() => _isListening = false));

                                _speechRecognition16.activate().then((result)=>
                                    setState(() => _isAvailable = result));
                                if(_isAvailable && !_isListening)
                                  _speechRecognition16.listen(locale: "en_US").then((result) => print(":::$result"));
                              },
                            ),
                            IconButton(

                              icon: Icon(Icons.mic_off,color: Colors.black,),
                              onPressed: (){
                                _speechRecognition16.setAvailabilityHandler((bool result)=>
                                    setState(() => _isAvailable = result));

                                _speechRecognition16.setRecognitionStartedHandler(()=>
                                    setState(() => _isListening = true));

                                _speechRecognition16.setRecognitionResultHandler((String speech)=>
                                    setState(() => resultText16 = speech ));

                                _speechRecognition16.setRecognitionCompleteHandler(()=>
                                    setState(() => _isListening = false));

                                _speechRecognition16.activate().then((result)=>
                                    setState(() => _isAvailable = result));
                                if(_isListening)
                                  _speechRecognition16.stop().then((result) => setState(() => _isListening = result));
                               // ans16=resultText;
                                //print("ans16 $ans16");
                                },
                            ),
                            Text(resultText16),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Container(
                  padding: EdgeInsets.symmetric(vertical: 15.0),
                  //margin: EdgeInsets.only(top:0.0,bottom: 65.0,left:0.0),
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.7),
                      border: Border.all(width: 1.0,color: Colors.black),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        //bottomLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0),
                      )
                  ),
                  child: Row(
                    children: <Widget>[
                      Container(
                        child: Checkbox(value: checkvalue, onChanged:(bool value){
                          setState(() {
                            checkvalue=value;
                          });
                        }),
                        padding: EdgeInsets.only(left: 10.0),
                      ),
                      SizedBox(height: 50.0,),
                      Text("மேலே உள்ள தகவலை\n இதன்மூலம் உறுதிப்படுத்துகிறேன்"
                        ,style: TextStyle(color: Colors.black,fontSize: 13.0,fontWeight:FontWeight.bold,),overflow: TextOverflow.ellipsis,),
                    ],
                  )
              ),


              Container(
                padding: EdgeInsets.only(left: 100.0, top: 50.0),
                child: RaisedButton(
                  child: Text(
                    'தொடரவும்',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      if (checkvalue == true) {
                        Scaffold.of(context)
                            .showSnackBar(
                            SnackBar(content: Text('தரவு செயலாக்கத்தில் உள்ளது.'))); print("$ans2");
                        _fs.collection('info').document('$userName').collection('Activities').document('Activity 2').setData({
                          //'email': userName,
                          qn1: ans1,
                          qn2: ans2,
                          qn3: ans3,
                          qn4: ans4,
                          qn5: ans5,
                          qn6: ans6,
                          qn7: ans7,
                          qn8: ans8,
                          qn9: ans9,
                          qn10: ans10,
                          qn11: ans11,
                          qn12: ans12,
                          qn13: ans13,
                          qn14: ans14,
                          qn15: ans15,
                          qn16: ans16,
                        });
                        setdate();
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => LoaderT()));
                      }
                      else {
                        Scaffold.of(context)
                            .showSnackBar(
                            SnackBar(content: Text('உங்கள் செயலை உறுதிப்படுத்தவும்.')));
                      }
                    }
                    },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Future<void> setdate() async{
    SharedPreferences logindata =await SharedPreferences.getInstance();
    logindata.setString('date',seventhday);
    print(logindata.getString('date'));
  }
}

