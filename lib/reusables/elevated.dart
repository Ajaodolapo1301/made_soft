import 'package:flutter/material.dart';

class Elevated extends StatelessWidget {
final image;
final text;
final number;


Elevated({this.text, this.number, this.image});


  @override
  Widget build(BuildContext context) {

    return     Container(
      width: 165,
      height: 130,
      child: Material(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        elevation: 1.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(image),
                SizedBox(width: 5,),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Text(number, style: TextStyle(fontSize: 20),),
                ),

              ],
            ),

SizedBox(height: 10,),
            Center(child: Text(text))
          ],
        ),


      ),

    );
  }
}