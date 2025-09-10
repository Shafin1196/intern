import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intern/auth_screen/verify_phone_otp.dart';
import '../widgetClass/column.dart';


class ForgetPasswordScreen extends ConsumerWidget{
  ForgetPasswordScreen({super.key});
  final _phoneController=TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.of(context).pop();
        }, icon: Icon(Icons.arrow_back_ios)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 24,left: 20,right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Center(
                    child: Text(
                      "Forget Password",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.green.shade700),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Center(
                    child: Text(
                      "Enter the phone number associated with your account and we’ll send you OTP to reset your password",
                      textAlign: TextAlign.center,
                      maxLines: 4,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Phone",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextField(
                      controller: _phoneController,
                      decoration: InputDecoration(
                        hintText: "Ex : +980010101010",
                        hintStyle: TextStyle(
                            color: Colors.grey.shade700, fontSize: 15),
                        border: fieldBorder(),
                        enabledBorder: fieldBorder(),
                        focusedBorder: fieldBorder(),
                      ),
                    ),
                  ],

                ),
                const SizedBox(height: 25,),
                SizedBox(
                  width: double.infinity - 40,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: ()//async
                    {
                      // final otpProvider=await ref.read(sendOtpProv(_phoneController.text).future);
                      // if(otpProvider.success){
                      //   ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
                      //   ScaffoldMessenger.of(context).showSnackBar(
                      //     SnackBar(content: Text(otpProvider.message),
                      //     duration: Duration(seconds: 3),
                      //     )
                      //   );
                      //   Navigator.of(context).push(
                      //   MaterialPageRoute(builder: (context)=>VerifyPhoneOtpScreen(phone: _phoneController.text,))
                      // );
                      // }
                      // else{
                      //   ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
                      //   ScaffoldMessenger.of(context).showSnackBar(
                      //     SnackBar(content: Text(otpProvider.message),
                      //     duration: Duration(seconds: 3),
                      //     )
                      //   );
                      // }
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context)=>VerifyPhoneOtpScreen(phone: _phoneController.text,isEmail: false,))
                      );

                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green.shade700),
                    child: Text(
                      "Confirm",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),
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