class LocationPoint {
  final String type;
  final String address;
  final List<double> coordinates;

  const LocationPoint({
    required this.type,
    required this.address,
    required this.coordinates,
  });

  factory LocationPoint.fromJson(Map<String, dynamic> json) {
    return LocationPoint(
      type: json['type'] ?? '',
      address: json['address'] ?? '',
      coordinates: (json['coordinates'] as List)
          .map((e) => (e as num).toDouble())
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'type': type,
        'address': address,
        'coordinates': coordinates,
      };
}

class Parcel {
  final LocationPoint pickupLocation;
  final LocationPoint destinationLocation;
  final String receiversName;
  final String contact;
  final String additionalInformation;
  final String parcelType;
  final double parcelValue;
  final double minParcelWeight;
  final double maxParcelWeight;
  final String ride;

  const Parcel({
    required this.pickupLocation,
    required this.destinationLocation,
    required this.receiversName,
    required this.contact,
    required this.additionalInformation,
    required this.parcelType,
    required this.parcelValue,
    required this.minParcelWeight,
    required this.maxParcelWeight,
    required this.ride,
  });

  factory Parcel.fromJson(Map<String, dynamic> json) {
    return Parcel(
      pickupLocation: LocationPoint.fromJson(json['pickupLocation']),
      destinationLocation: LocationPoint.fromJson(json['destinationLocation']),
      receiversName: json['receiversName'] ?? '',
      contact: json['contact'] ?? '',
      additionalInformation: json['additionalInformation'] ?? '',
      parcelType: json['parcelType'] ?? '',
      parcelValue: (json['parcelValue'] as num).toDouble(),
      minParcelWeight: (json['minParcelWeight'] as num).toDouble(),
      maxParcelWeight: (json['maxParcelWeight'] as num).toDouble(),
      ride: json['ride'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        'pickupLocation': pickupLocation.toJson(),
        'destinationLocation': destinationLocation.toJson(),
        'receiversName': receiversName,
        'contact': contact,
        'additionalInformation': additionalInformation,
        'parcelType': parcelType,
        'parcelValue': parcelValue,
        'minParcelWeight': minParcelWeight,
        'maxParcelWeight': maxParcelWeight,
        'ride': ride,
      };

  Parcel copyWith({
    LocationPoint? pickupLocation,
    LocationPoint? destinationLocation,
    String? receiversName,
    String? contact,
    String? additionalInformation,
    String? parcelType,
    double? parcelValue,
    double? minParcelWeight,
    double? maxParcelWeight,
    String? ride,
  }) {
    return Parcel(
      pickupLocation: pickupLocation ?? this.pickupLocation,
      destinationLocation: destinationLocation ?? this.destinationLocation,
      receiversName: receiversName ?? this.receiversName,
      contact: contact ?? this.contact,
      additionalInformation:
          additionalInformation ?? this.additionalInformation,
      parcelType: parcelType ?? this.parcelType,
      parcelValue: parcelValue ?? this.parcelValue,
      minParcelWeight: minParcelWeight ?? this.minParcelWeight,
      maxParcelWeight: maxParcelWeight ?? this.maxParcelWeight,
      ride: ride ?? this.ride,
    );
  }
}
