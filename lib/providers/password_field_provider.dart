import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import '../models/login_response.dart';
final passwordVisibleProvider = StateProvider<bool>((ref) => true);
final newPasswordVisibleProvider = StateProvider<bool>((ref) => true);
final logInProvider=StateNotifierProvider<LoginNotifier,LoginState>((ref) => LoginNotifier());
// state class
class LoginState {
  final bool isLoading;
  final LoginResponse? response;
  final String? error;
  LoginState({this.isLoading = false, this.response, this.error});
}
//notifier class
class LoginNotifier extends StateNotifier<LoginState>{
  LoginNotifier():super(LoginState());
  Future<void> logIn(Map<String, String> credentials) async {
    state = LoginState(isLoading: true);
    try {
      final response = await http.post(
        Uri.parse("https://10.10.7.111:5000/api/v1/auth/login"),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(credentials),
      );
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        state = LoginState(response: LoginResponse.fromJson(json));
      } else {
        state = LoginState(error: "Server error ${response.statusCode}");
      }
    } catch (e) {
      state = LoginState(error: "Server error: $e");
    }
  }
}


