class OrderHistoryResponse {
  final bool success;
  final String message;
  final OrderHistoryData data;

  OrderHistoryResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory OrderHistoryResponse.fromJson(Map<String, dynamic> json) {
    return OrderHistoryResponse(
      success: json['success'],
      message: json['message'],
      data: OrderHistoryData.fromJson(json['data']),
    );
  }
}

class OrderHistoryData {
  final List<Order> orders;
  final Meta meta;

  OrderHistoryData({
    required this.orders,
    required this.meta,
  });

  factory OrderHistoryData.fromJson(Map<String, dynamic> json) {
    return OrderHistoryData(
      orders: (json['data'] as List)
          .map((e) => Order.fromJson(e))
          .toList(),
      meta: Meta.fromJson(json['meta']),
    );
  }
}

class Order {
  final String id;
  final String orderId;
  final Location pickupLocation;
  final Location destinationLocation;
  final String receiversName;
  final String contact;
  final String parcelType;
  final num parcelValue;
  final num? parcelWeight;
  final String ride;
  final num distance;
  final num deliveryCharge;
  final num commissionAmount;
  final num riderAmount;
  final String status;
  final String pickupAddress;
  final String destinationAddress;
  final Payment payment;
  final DeliveryInfo deliveryInfo;
  final Rider rider;

  Order({
    required this.id,
    required this.orderId,
    required this.pickupLocation,
    required this.destinationLocation,
    required this.receiversName,
    required this.contact,
    required this.parcelType,
    required this.parcelValue,
    this.parcelWeight,
    required this.ride,
    required this.distance,
    required this.deliveryCharge,
    required this.commissionAmount,
    required this.riderAmount,
    required this.status,
    required this.pickupAddress,
    required this.destinationAddress,
    required this.payment,
    required this.deliveryInfo,
    required this.rider,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['_id'],
      orderId: json['orderId'],
      pickupLocation: Location.fromJson(json['pickupLocation']),
      destinationLocation: Location.fromJson(json['destinationLocation']),
      receiversName: json['receiversName'],
      contact: json['contact'],
      parcelType: json['parcelType'],
      parcelValue: json['parcelValue'],
      parcelWeight: json['parcelWeight'],
      ride: json['ride'],
      distance: json['distance'],
      deliveryCharge: json['deliveryCharge'],
      commissionAmount: json['commissionAmount'],
      riderAmount: json['riderAmount'],
      status: json['status'],
      pickupAddress: json['pickupAddress'],
      destinationAddress: json['destinationAddress'],
      payment: Payment.fromJson(json['payment']),
      deliveryInfo: DeliveryInfo.fromJson(json['deliveryInfo']),
      rider: Rider.fromJson(json['rider']),
    );
  }
}

class Location {
  final String type;
  final String address;
  final List<num> coordinates;

  Location({
    required this.type,
    required this.address,
    required this.coordinates,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      type: json['type'],
      address: json['address'],
      coordinates: List<num>.from(json['coordinates']),
    );
  }
}

class Payment {
  Payment();

  factory Payment.fromJson(Map<String, dynamic> json) {
    return Payment();
  }
}

class DeliveryInfo {
  final String status;
  final DeliveryTimestamps timestamps;

  DeliveryInfo({
    required this.status,
    required this.timestamps,
  });

  factory DeliveryInfo.fromJson(Map<String, dynamic> json) {
    return DeliveryInfo(
      status: json['status'],
      timestamps: DeliveryTimestamps.fromJson(json['timestamps']),
    );
  }
}

class DeliveryTimestamps {
  final String assignedAt;
  final String acceptedAt;
  final String arrivedPickedUpAt;
  final String startedAt;
  final String arrivedDestinationAt;
  final String deliveredAt;

  DeliveryTimestamps({
    required this.assignedAt,
    required this.acceptedAt,
    required this.arrivedPickedUpAt,
    required this.startedAt,
    required this.arrivedDestinationAt,
    required this.deliveredAt,
  });

  factory DeliveryTimestamps.fromJson(Map<String, dynamic> json) {
    return DeliveryTimestamps(
      assignedAt: json['assignedAt'],
      acceptedAt: json['acceptedAt'],
      arrivedPickedUpAt: json['arrivedPickedUpAt'],
      startedAt: json['startedAt'],
      arrivedDestinationAt: json['arrivedDestinationAt'],
      deliveredAt: json['deliveredAt'],
    );
  }
}

class Rider {
  final String name;
  final String email;
  final String image;
  final Rating rating;

  Rider({
    required this.name,
    required this.email,
    required this.image,
    required this.rating,
  });

  factory Rider.fromJson(Map<String, dynamic> json) {
    return Rider(
      name: json['name'],
      email: json['email'],
      image: json['image'],
      rating: Rating.fromJson(json['rating']),
    );
  }
}

class Rating {
  final num? average;

  Rating({this.average});

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      average: json['average'],
    );
  }
}

class Meta {
  final int total;
  final int limit;
  final int page;
  final int totalPage;

  Meta({
    required this.total,
    required this.limit,
    required this.page,
    required this.totalPage,
  });

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      total: json['total'],
      limit: json['limit'],
      page: json['page'],
      totalPage: json['totalPage'],
    );
  }
}