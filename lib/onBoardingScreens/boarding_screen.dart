import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../auth_screen/create_screen.dart';
import '../auth_screen/sign_in.dart';
import '../widgetClass/column.dart';

class BoardingScreen extends ConsumerWidget {
  final _pageController = PageController();

  BoardingScreen({super.key});
  @override
  Widget build(BuildContext context,ref) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: PageView(
                  controller: _pageController,
                  children: [
                    OnBoardColumn().customColumn(
                        imgPath: "assets/images/1.png",
                        title: "Welcome to Parcel Delivery",
                        body:
                        "Your go-to solution for fast, reliable parcel delivery. Whether you're sending or receiving, we make it easy and quick.",
                        transform: true),
                    OnBoardColumn().customColumn(
                      imgPath: "assets/images/2.png",
                      title: "Fasy Deliveries, Anytime",
                      body:
                      "Need a quick delivery? Simply book a ride, and we'll take care of the rest. Trust us to get your parcels to their destination, safely and on time.",
                    ),
                    OnBoardColumn().customColumn(
                      imgPath: "assets/images/3.png",
                      title: "Ready to Deliver?",
                      body:
                      "Let's get your parcels moving! With just a few taps, your package is on its way. Speedy, secure, and hassle-free deliveries-every time.",
                    ),
                  ],
                ),
              ),
              SmoothPageIndicator(
                controller: _pageController,
                count: 3,
                effect: WormEffect(
                  dotHeight: 12,
                  dotWidth: 12,
                  activeDotColor: Colors.black,
                  dotColor: Colors.grey.shade400,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              SizedBox(
                width: 300,
                height: 50,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => CreateScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green.shade700),
                    child: Text(
                      "Sign Up",
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    )),
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                width: 300,
                height: 50,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => SignIn()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.green, width: 1),
                            borderRadius: BorderRadius.circular(25))),
                    child: Text(
                      "Sign In",
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    )),
              ),
              SizedBox(
                height: 35,
              )
            ],
          )),
    );
  }
}
