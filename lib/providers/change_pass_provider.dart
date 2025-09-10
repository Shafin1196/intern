import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import '../models/otp_response.dart';


final changePasswordProvider=FutureProvider.family<OtpResponse,Map<String,dynamic>>(
        (ref,passwords)async{
      try{
        final response=await http.post(
            Uri.parse("https://10.10.7.111:5000/api/v1/auth/reset-password"),
            headers: {
              'Content-Type': 'application/json',
              'Authorization': passwords['Authorization'],
            },
            body: {
              "newPassword":passwords["password"],
              "confirmPassword":passwords["password"],
            }
        );
        if(response.statusCode==200){
          final json=jsonDecode(response.body);
          return OtpResponse.fromJson(json);
        }
        else{
          return OtpResponse(success: false, message: "Error:${response.statusCode}");
        }
      }catch(e){
        return OtpResponse(success: false, message: "Error:$e");
      }
    }
);