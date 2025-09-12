import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intern/models/parcel.dart';
final parcelProvider = StateNotifierProvider<ParcelNotifier, Parcel?>((ref) => ParcelNotifier());
class ParcelNotifier extends StateNotifier<Parcel?> {
  ParcelNotifier() : super(null);
  void setParcel(Parcel parcel) {
    state = parcel;
  }
  void setParcelLocation(LocationPoint pickup, LocationPoint destination) {
    if(state!=null){
      state=state!.copyWith(pickupLocation: pickup, destinationLocation: destination);
    }
  }
  void reset() {
    state = null;
  }
  void setParcelType(String type) {
    state=state?.copyWith(parcelType: type);
  }

  //for test purpose
  void printState(){
    if(state!=null){
      print(state!.toJson());
  }
  }
}

