import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/register.dart';


final registerProvider = FutureProvider.family<RegisterResponse, Map<String, dynamic>>((ref, body) async {
  try{
    final response = await http.post(
      Uri.parse('https://10.10.7.111:5000/api/v1/user'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(body),
    );
    if(response.statusCode == 200){
      final json = jsonDecode(response.body);
      return RegisterResponse.fromJson(json);
    } else{
      return RegisterResponse(success: false, message: 'Error ${response.statusCode}', data: null);
    }
  } catch (e) {
    return RegisterResponse(success: false, message: 'Error: $e', data: null);
  }
});