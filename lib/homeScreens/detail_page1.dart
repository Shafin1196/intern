import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intern/homeWidgets/choose_location.dart';

class DetailPage1 extends ConsumerStatefulWidget{
  const DetailPage1({super.key});

  @override
  ConsumerState<DetailPage1> createState() {
    return _detailPage1State();
  }

}
class _detailPage1State extends ConsumerState<DetailPage1>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SafeArea(child: Text("Choose location", style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),)),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: ChooseLocation(),
    );
  }

}