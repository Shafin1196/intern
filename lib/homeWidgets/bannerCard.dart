import 'package:flutter/material.dart';

class BannerCard extends StatelessWidget {
  final String text;
  final String subtext;
  final String image;

  const BannerCard({required this.text, required this.subtext, required this.image});

  @override
  Widget build(BuildContext context) {
    return  Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10,right: 20,top: 20),
                  child: Text(text, style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold)),
                ),
                SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.only(left: 10,right: 60),
                  child: Text(subtext, style: TextStyle(fontSize: 10, color: Colors.white)),
                ),
              ],
            ),
          ),
          Positioned(
            right: -20,
            bottom: -20,
            child: Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()..scale(-1.0, 1.0),
          child: Image.asset("assets/images/man.png", height: 150, width: 150),
        ) // adjust size as needed
          ),
        ],
      
    );
  }
}