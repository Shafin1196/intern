import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intern/models/parcel.dart';
final parcelProvider = StateNotifierProvider<ParcelNotifier, Parcel?>((ref) => ParcelNotifier());
class ParcelNotifier extends StateNotifier<Parcel?> {
  ParcelNotifier() : super(null);
  void setParcel(Parcel parcel) {
    state = parcel;
  }
  void updateReceiver(String name, String contact) {
    if (state != null) {
      state = state!.copyWith(receiversName: name, contact: contact);
    }
  }
  void updateRide(String rideType) {
    if (state != null) {
      state = state!.copyWith(ride: rideType);
    }
  }
  void reset() {
    state = null;
  }
}

