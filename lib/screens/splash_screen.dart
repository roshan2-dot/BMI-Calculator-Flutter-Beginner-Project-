// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';

import 'home_screen.dart';

class SplashScreen extends StatefulWidget{
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override

  void initState(){
    super.initState();

    Timer(Duration (seconds: 3), (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen(),
      ));
    });
  }
  @override
  Widget build (BuildContext context){
    return Scaffold(
      body: Container (
        color: Colors.black,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:const [

              Text('BMI Calculator',
              style: TextStyle(color: Colors.yellow,fontSize: 30.0,fontWeight: FontWeight.w300,
              ),
              ),
              SizedBox(height: 20,),
              CircularProgressIndicator(
                color: Colors.yellow,
              ),
            ],
          ),
        ),
      )
    );
   }
}