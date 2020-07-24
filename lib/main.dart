import 'package:flutter/material.dart';
import 'package:made_soft_logic/screens/Homepage.dart';
import 'package:made_soft_logic/screens/home.dart';
import 'package:made_soft_logic/screens/page.dart';
import 'package:made_soft_logic/screens/register.dart';
import 'package:made_soft_logic/utils/colors.dart';
import 'package:made_soft_logic/view_model/appState.dart';
import 'package:provider/provider.dart';

Future <void> main() async {



  runApp(MultiProvider(
      providers: [

        ChangeNotifierProvider(create: (_)=>AppState()),

      ],
      child: MyApp()));
}


class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(brightness: Brightness.dark).copyWith(
          primaryColor: Colors.black,

      ),



      title: 'Live Your Dream',
      theme: ThemeData(
          fontFamily: "BASISGROTESQUEPRO"
      ),
      home: Register(),
    );
  }
}


