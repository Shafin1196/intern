import 'dart:async';
import 'package:flutter/material.dart';
import 'boarding_screen.dart';

class SplashScreen extends StatefulWidget{
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() {
    return _splashScreenState();
  }
}

class _splashScreenState extends State<SplashScreen>{
  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 4),(){
      Navigator.pushReplacement(context,
        MaterialPageRoute(
            builder: (context)=> BoardingScreen()),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: Container(
          height: 150,
          width: 150,
          decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle
          ),
          child: Center(
            child: Text("logo",
              style: TextStyle(
                  fontSize: 38,
                  color: Colors.black
              ),
            ),
          ),
        ),

      ),
    );
  }

}