import 'package:flutter/material.dart';

class Elevated extends StatelessWidget {
final image;
final text;
final number;


Elevated({this.text, this.number, this.image});


  @override
  Widget build(BuildContext context) {

    return     Card(
      elevation: 0.0,
      child: Container(
        width: 165,
        height: 130,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(image),
                SizedBox(width: 10,),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Text(number, style: TextStyle(fontSize: 20, color: Color(0xff6619EA)),),
                ),

              ],
            ),

SizedBox(height: 20,),
            Center(child: Text(text, style: TextStyle(fontSize: 20),))
          ],
        ),

      ),
    );
  }
}