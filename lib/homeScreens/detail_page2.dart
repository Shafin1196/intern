import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intern/auth_screen/create_screen.dart';

class DetailPage2 extends ConsumerStatefulWidget{
  const DetailPage2({super.key});

  @override
  ConsumerState<DetailPage2> createState() {
    return _detailPage2State();
  }

}
class _detailPage2State extends ConsumerState<DetailPage2>{
  final _formKey=GlobalKey<FormState>();
  final _reciverController=TextEditingController();
  final _numberController=TextEditingController();
  final _additionalController=TextEditingController();
  final _weightController=TextEditingController();
  final _parcelValueController=TextEditingController();
  bool _isbike=true;
  bool _iscar=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SafeArea(child: Text("Parcel Details", style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),)),
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                text("Receivers Name"),
                SizedBox(height: 10,),
                textFormField(
                  controller: _reciverController, 
                  hintText: "Enter Receivers Name", 
                  validator: (value){
                    if(value==null || value.isEmpty){
                      return "Please enter Receivers Name";
                    }
                    return null;
                  },
                  ),
                SizedBox(height: 20,),
                text("Contact Number"),
                SizedBox(height: 10,),
                textFormField(
                  controller: _numberController,
                  hintText: "Enter Contact Number",
                  validator: (value){
                    if(value==null || value.isEmpty){
                      return "Please enter Contact Number";
                    }
                    return null;
                  },
                  ),
                SizedBox(height: 20,),
              ],
            ),
          ),
        ),
      ),
      
    );
  }

}