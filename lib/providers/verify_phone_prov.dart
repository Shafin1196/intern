import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;


import '../models/login_response.dart';
import '../models/otp_response.dart';

final verifyPhoneOtpProvider=FutureProvider.family<LoginResponse,Map<String,String>>((ref,verify)async{

  try{
    final response=await http.post(
        Uri.parse(""),//no phone otp check api provided.we can use this as email otp verify
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(verify)
    );
    if(response.statusCode==200){
      final json=jsonDecode(response.body);
      return LoginResponse.fromJson(json);
    }
    else{
      return LoginResponse(success: false, message: "Error:${response.statusCode}",data: "");
    }
  }catch (e){
    return LoginResponse(success: false, message: "Server error:$e",data: "");
  }

});


final sendOtpProv=FutureProvider.family<OtpResponse,String>((ref,phone)async{
  try{
    final response=await http.post(
        Uri.parse("https://10.10.7.111:5000/api/v1/auth/forget-password "),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({"phone":phone})
    );
    if(response.statusCode==200){
      final json=jsonDecode(response.body);
      return OtpResponse.fromJson(json);
    }
    else{
      return OtpResponse(success: false, message: "Error:${response.statusCode}");
    }

  }catch(e){
    return OtpResponse(success: false, message: "Server Error $e");
  }
});