import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';

import 'package:frontend1db/LoginT.dart';



class DashboardT extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[700],
      appBar: AppBar(
        title: Text("Dashboard"),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
       actions: <Widget>[
         IconButton(icon: Icon(Icons.arrow_forward_ios), onPressed: (){
           Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginT()));
         }
         )
       ],
       // icon: Icons.keyboard_arrow_right,
      ),

      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Background(),
            Details(),
          ],
        ),
      ),
    );
  }
}

class Background extends StatelessWidget {
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




class Details extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    //calculate


    double min = 97.0;
    //double max=105.0;
    String info;
    Random rnd = new Random();
    double temp = min + rnd.nextDouble();
    String t = temp.toString();
    final startindex = t.indexOf('9');
    final finalindex = t.indexOf('.');
    String temperature = t.substring(startindex, finalindex + 2);
    int cough = rnd.nextInt(100);
    int sneeze = rnd.nextInt(100);
    if (cough > 50 || sneeze > 30) {
      if (temp > 98.0)
        info =
        "\nஉங்கள் இருமல் மற்றும் தும்மல் பாதுகாப்பான வரம்பில் இல்லை, உடனடியாக அருகிலுள்ள மருத்துவமனைக்குச் செல்லுங்கள்.";
      else
        info =
        "\nஉங்களுக்கு காய்ச்சல் இல்லை ஆனால் உங்கள் இருமல் மற்றும் தும்மல் பாதுகாப்பான வரம்பில் இல்லை உடனடியாக அருகிலுள்ள மருத்துவமனைக்குச் செல்லுங்கள்.";

      return Container(
        child: Center(
          child: Column(
            children: <Widget>[
              IconButton(
                onPressed: () {
                  Details();
                },
                icon: Icon(Icons.person),
                color: Colors.red,
                iconSize: 200.0,
              ),
              SizedBox(height: 40.0,),
              Container(
                  decoration:  BoxDecoration(
                    border: Border.all(width: 1.0,color: Colors.black),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  padding: EdgeInsets.fromLTRB(25.0, 10.0, 0.0, 35.0),
                  child: Text(
                    "\nஉங்கள் உடல் வெப்பநிலை: $temperature \nஉங்கள் இருமல் இன்று $cough முறை \nஉங்கள் தும்மல் இன்று $sneeze முறை \n$info",
                    style: TextStyle(color: Colors.red[900], fontSize: 18.0),)),
              //  Text(,style: TextStyle(color: Colors.red,fontSize: 12.0),),


            ],
          ),),
      );
    }
    else {
      if (temp > 98.0)
        {
        info ="\nஉங்களுக்கு காய்ச்சல் உள்ளது உங்கள் இருமல் மற்றும் தும்மல் பாதுகாப்பான எல்லைக்குள் உள்ளது, உங்கள் ஆரோக்கியத்தை கவனித்துக் கொள்ளுங்கள்.";
        return Container(
          child: Center(
            child: Column(
              children: <Widget>[
                IconButton(
                  onPressed: () {
                    Details();
                  },
                  icon: Icon(Icons.person),
                  color: Colors.yellowAccent,
                  iconSize: 200.0,
                ),SizedBox(height: 40.0,),
                Container(

                    padding: EdgeInsets.fromLTRB(25.0, 10.0, 0.0, 35.0),
                  decoration:  BoxDecoration(
                    border: Border.all(width: 1.0,color: Colors.black),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                    child: Text(
                      "\nஉங்கள் உடல் வெப்பநிலை: $temperature \nஉங்கள் இருமல் இன்று $cough முறை \nஉங்கள் தும்மல் இன்று $sneeze முறை \n$info",
                      style: TextStyle(
                          color: Colors.yellow[700], fontSize: 18.0),),
                    ),

              ],
            ),),
        );

        }
      else
        {
        info =
        "\nஉங்களுக்கு காய்ச்சல் இல்லை & உங்கள் இருமல் மற்றும் தும்மல் பாதுகாப்பான எல்லைக்குள் உள்ளது.";
      return Container(

        child: Center(
          child: Column(
            children: <Widget>[
              IconButton(
                onPressed: () {
                  Details();
                },
                icon: Icon(Icons.person),
                color: Colors.green,
                iconSize: 200.0,
              ),SizedBox(height: 40.0,),
              Container(
                  padding: EdgeInsets.fromLTRB(25.0, 10.0, 0.0, 35.0),
                  decoration:  BoxDecoration(
                    border: Border.all(width: 1.0,color: Colors.black),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  child: Text(
                    "\nஉங்கள் உடல் வெப்பநிலை: $temperature \nஉங்கள் இருமல் இன்று $cough முறை \nஉங்கள் தும்மல் இன்று $sneeze முறை \n$info",
                    style: TextStyle(
                        color: Colors.green[900], fontSize: 18.0),)),

            ],
          ),),
      );
    }
  }
  }
}

