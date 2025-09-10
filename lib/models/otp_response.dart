class OtpResponse {
  final bool success;
  final String message;
  OtpResponse({required this.success,required this.message});

  factory OtpResponse.fromJson(Map<String,dynamic>json){
    return OtpResponse(
      success: json['success'],
      message: json["message"],
    );
  }
}