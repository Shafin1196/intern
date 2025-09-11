import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intern/auth_screen/create_screen.dart';
import 'package:intern/homeScreens/summery.dart';
import 'package:intern/homeWidgets/parcel_type_overlay.dart';
import 'package:intern/providers/parcel_providers.dart';

class DetailPage2 extends ConsumerStatefulWidget {
  const DetailPage2({super.key});

  @override
  ConsumerState<DetailPage2> createState() {
    return _detailPage2State();
  }
}

class _detailPage2State extends ConsumerState<DetailPage2> {
  final _formKey = GlobalKey<FormState>();
  final _reciverController = TextEditingController();
  final _numberController = TextEditingController();
  final _additionalController = TextEditingController();
  double _weightControllerStart = 0;
  double _weightControllerEnd = 5.0;
  final _parcelValueController = TextEditingController();
  bool _isbike = true;
  bool _iscar = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SafeArea(
            child: Text(
          "Parcel Details",
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        )),
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
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                text("Receivers Name"),
                textFormField(
                  controller: _reciverController,
                  hintText: "Enter Receivers Name",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter Receivers Name";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                text("Contact Number"),
                textFormField(
                  controller: _numberController,
                  hintText: "Enter Contact Number",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter Contact Number";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                text("Additional Instructions"),
                textFormField(
                  controller: _additionalController,
                  hintText: "Give Additional Instructions",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter Additional Instructions";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                text("Parcel Type"),
                TextFormField(
                  controller: TextEditingController(
                      text: ref.watch(parcelProvider)?.parcelType ?? ''),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.grey.shade500, width: 1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.grey.shade500, width: 1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.grey.shade500, width: 1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    suffixIcon: IconButton(
                        onPressed: () {
                          
                          showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              builder: (ctx) {
                                return ParcelTypeOverlay();
                              });
                        },
                        icon: Icon(Icons.arrow_drop_down_circle_outlined)),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter Parcel type";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                text("Parcel Value"),
                textFormField(
                  controller: _parcelValueController,
                  hintText: "Enter Parcel Value",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter Parcel Value";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                text("Parcel Weight"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "0kg - 5kg",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.red),
                    ),
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: Colors.black,
                    inactiveTrackColor: Colors.grey[300],
                    trackHeight: 8,
                    thumbColor: Colors.green, // set to red for red dots
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 8),
                    overlayColor: Colors.green.withAlpha(32),
                  ),
                  child: RangeSlider(
                    values: RangeValues(
                        _weightControllerStart, _weightControllerEnd),
                    min: 0,
                    max: 5,
                    onChanged: (values) {
                      setState(() {
                        _weightControllerStart = values.start;
                        _weightControllerEnd = values.end;
                      });
                    },
                  ),
                ),
              const SizedBox(height: 10,),
              text("Select Ride"),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        _isbike = true;
                        _iscar = false;
                      });
                    },
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: _isbike ? Colors.green.shade800 : Colors.grey.shade300,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset("assets/images/bike.png", height: 60, width: 60,),
                          Text("Bike", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.black),)
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 20,),
                  InkWell(
                    onTap: () {
                      setState(() {
                        _isbike = false;
                        _iscar = true;
                      });
                    },
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: _iscar ? Colors.green.shade800 : Colors.grey.shade300,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset("assets/images/car.png", height: 60, width: 60,),
                          Text("Car", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.black),)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width - 40,
            height: 47,
            child: ElevatedButton(
              onPressed: () {
                
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => Summery()),
                );
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade700,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25))),
              child: Text(
                      "Continue",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
            ),
          ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
