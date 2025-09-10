import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Summery extends ConsumerWidget{
  const Summery({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
    
        title: SafeArea(child: Text("Summery", style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),)),
        centerTitle: true,
        elevation: 2,
        shadowColor: Colors.grey.shade100,
        leading: SafeArea(
          child: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
      ),
      body: Center(child: Text("Summery Screen")),
    );
  }
}