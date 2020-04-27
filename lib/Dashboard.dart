import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';



class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[700],
      appBar: AppBar(
        title: Text("Dashboard"),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
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

    double min=97.0;
    //double max=105.0;
    String info;
    Random rnd = new Random();
    double temp = min+ rnd.nextDouble();
    String t = temp.toString();
    final startindex = t.indexOf('9');
    final finalindex = t.indexOf('.');
    String temperature = t.substring(startindex,finalindex+2);
    int cough = rnd.nextInt(100);
    int sneeze = rnd.nextInt(100);
    if(cough>50||sneeze>30)
    {
    if (temp > 98.0)
      info = "\nyou have fever&\nyou coughed/sneezed beyond the safe limit,\nyou need to visit nearby health center immediately.";
    else
      info = "\nyou don't have fever but\nyou coughed/sneezed beyond the safe limit,\nyou need to visit nearby \nhealth center immediately.";

    return Container(
      child: Center(
        child: Column(
          children: <Widget>[
            IconButton(
              onPressed: (){
                Details();
              },
              icon: Icon(Icons.person),
              color: Colors.red,
              iconSize: 200.0,
            ),
            Container(
                padding: EdgeInsets.fromLTRB(40.0, 0.0, 0.0, 0.0),
                child: Text("\nyour body temperature: $temperature \nyour coughed $cough times today \nyou sneezed $sneeze times today \n$info",style: TextStyle(color: Colors.red[900],fontSize: 20.0),)),
            //  Text(,style: TextStyle(color: Colors.red,fontSize: 12.0),),


          ],
        ),),
    );
    }
    else
      {
        if (temp > 98.0) {
          info =
          "\nyou have fever&\nyour coughing & sneezing is within safer limit,\ntake care of your health.";

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
                  ),
                  Container(
                      padding: EdgeInsets.fromLTRB(40.0, 0.0, 0.0, 0.0),
                      child: Text(
                        "\nyour body temperature: $temperature \nyour coughed $cough times today \nyou sneezed $sneeze times today \n$info",
                        style: TextStyle(
                            color: Colors.yellow[700], fontSize: 20.0),)),

                ],
              ),),
          );
        }
        else {
          info =
          "\nyou don't have fever &\nyour coughing & sneezing is within safer limit.";
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
                  ),
                  Container(
                      padding: EdgeInsets.fromLTRB(40.0, 0.0, 0.0, 0.0),
                      child: Text(
                        "\nyour body temperature: $temperature \nyour coughed $cough times today \nyou sneezed $sneeze times today \n$info",
                        style: TextStyle(
                            color: Colors.green[900], fontSize: 20.0),)),

                ],
              ),),
          );
        }
      }


      }
}