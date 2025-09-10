
class GeoLocation {
  final String type;
  final List<double> coordinates;

  GeoLocation({required this.type, required this.coordinates});

  factory GeoLocation.fromJson(Map<String, dynamic> json) {
    return GeoLocation(
      type: json['type'],
      coordinates: (json['coordinates'] as List)
          .map((e) => (e as num).toDouble())
          .toList(),
    );
  }
}

class UserData {
  final String name;
  final String role;
  final String contact;
  final String countryCode;
  final String email;
  final String password;
  final String location;
  final String image;
  final String status;
  final bool verified;
  final GeoLocation geoLocation;
  final String id;
  final String createdAt;
  final String updatedAt;

  UserData({
    required this.name,
    required this.role,
    required this.contact,
    required this.countryCode,
    required this.email,
    required this.password,
    required this.location,
    required this.image,
    required this.status,
    required this.verified,
    required this.geoLocation,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      name: json['name'],
      role: json['role'],
      contact: json['contact'],
      countryCode: json['countryCode'],
      email: json['email'],
      password: json['password'],
      location: json['location'],
      image: json['image'],
      status: json['status'],
      verified: json['verified'],
      geoLocation: GeoLocation.fromJson(json['geoLocation']),
      id: json['_id'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }
}

class RegisterResponse {
  final bool success;
  final String message;
  final UserData? data;

  RegisterResponse({required this.success, required this.message, this.data});

  factory RegisterResponse.fromJson(Map<String, dynamic> json) {
    return RegisterResponse(
      success: json['success'],
      message: json['message'],
      data: json['data'] != null ? UserData.fromJson(json['data']) : null,
    );
  }
}


class RegistrationData {
  final String name;
  final String role;
  final String contact;
  final String countryCode;
  final String email;
  final String password;

  RegistrationData({
    required this.name,
    required this.role,
    required this.contact,
    required this.countryCode,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'role': role,
      'contact': contact,
      'countryCode': countryCode,
      'email': email,
      'password': password,
    };
  }
}