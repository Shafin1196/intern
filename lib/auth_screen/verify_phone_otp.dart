import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../providers/verify_phone_prov.dart';
import 'reset_password.dart';

class VerifyPhoneOtpScreen extends ConsumerStatefulWidget {
  final phone;
  final isEmail;
  const VerifyPhoneOtpScreen({super.key, required this.phone,required this.isEmail});
  @override
  ConsumerState<VerifyPhoneOtpScreen> createState() {
    return _VerifyPhoneOtpScreenState();
  }
}

class _VerifyPhoneOtpScreenState extends ConsumerState<VerifyPhoneOtpScreen> {
  var _seconds = 60;
  Timer? _timer;
  var _otp;
  final String _resend = "Resend OTP";
  String _emailOrPhone="";

  @override
  void initState() {
    super.initState();
    _startTimer();
    _emailOrPhone=widget.isEmail? "email":"phone number";
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_seconds > 0) {
        setState(() {
          _seconds--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back_ios)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 24, left: 20, right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Center(
                    child: Text(
                      "Verify OTP",
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
                      "Enter your OTP which has been sent to your $_emailOrPhone and completely verify your account.",
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
                PinCodeTextField(
                  appContext: context,
                  length: 4,
                  onChanged: (value) {
                    setState(() {
                      _otp = value;
                    });
                  },
                  textStyle:
                  TextStyle(fontWeight: FontWeight.normal, fontSize: 20),
                  keyboardType: TextInputType.number,
                  pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(15),
                      fieldHeight: 60,
                      fieldWidth: 60,
                      activeColor: Colors.grey.shade400,
                      activeFillColor: Colors.grey.shade400,
                      inactiveColor: Colors.grey.shade400,
                      inactiveFillColor: Colors.grey.shade400,
                      selectedColor: Colors.grey.shade400,
                      selectedFillColor: Colors.grey.shade400,
                      borderWidth: 0.5),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 20, bottom: 10),
                  child: Center(
                    child: Text(
                      "A code has been sent to your $_emailOrPhone",
                      textAlign: TextAlign.center,
                      maxLines: 4,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () async {
                    final otpProvider =
                    await ref.read(sendOtpProv(widget.phone).future);
                    if (otpProvider.success) {
                      setState(() {
                        _seconds=60;
                      });
                      ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(otpProvider.message),
                        duration: Duration(seconds: 3),
                      ));
                    } else {
                      ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(otpProvider.message),
                        duration: Duration(seconds: 3),
                      ));
                    }
                  },
                  child: Text(
                    _seconds == 0 ? _resend : "Resend in 00:$_seconds",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: double.infinity - 40,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () //async
                    {
                      // final verifyProv = await ref.read(verifyPhoneOtpProvider(
                      //     {"Phone": widget.phone, "oneTimeCode": _otp}).future);
                      // if (verifyProv.success) {
                      //   ScaffoldMessenger.of(context)
                      //       .hideCurrentMaterialBanner();
                      //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      //     content: Text(verifyProv.message),
                      //     duration: Duration(seconds: 3),
                      //   ));
                      //   Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ));
                      // } else {
                      //   ScaffoldMessenger.of(context)
                      //       .hideCurrentMaterialBanner();
                      //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      //     content: Text(verifyProv.message),
                      //     duration: Duration(seconds: 3),
                      //   ));
                      // }
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ResetPassword(authorization: "djhds",)));
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green.shade700),
                    child: Text(
                      "Verify",
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
