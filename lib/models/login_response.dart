class LoginResponse {
  final bool success;
  final String message;
  final String data;
  LoginResponse({required this.success,required this.message,required this.data});

  factory LoginResponse.fromJson(Map<String,dynamic>json){
    return LoginResponse(
        success: json["success"],
        message: json["message"],
        data: json["data"]
    );
  }
}