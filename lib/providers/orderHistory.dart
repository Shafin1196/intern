import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intern/models/order_history.dart';
import "package:http/http.dart" as http;
final orderHistoryProvider = FutureProvider<OrderHistoryResponse>((ref) async {
  // Replace with your API call
  try{
  final response = await http.get(Uri.parse('https://10.10.7.111:5000/api/v1/report/user-order-history?status=completed'));
  if(response.statusCode != 200){
    throw Exception('Failed to load order history: ${response.statusCode}');
  }
  final data = jsonDecode(response.body);
  return OrderHistoryResponse.fromJson(data);
  }catch(e){
    throw Exception('Failed to load order history: $e');
  }
});