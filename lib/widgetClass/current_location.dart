// import 'package:geocoding/geocoding.dart';
// import 'package:geolocator/geolocator.dart';

// Future<Position> getCurrentPosition() async {
//   bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
//   if (!serviceEnabled) {
//     await Geolocator.openLocationSettings();
//     return Future.error('Location services are disabled.');
//   }

//   LocationPermission permission = await Geolocator.checkPermission();
//   if (permission == LocationPermission.denied) {
//     permission = await Geolocator.requestPermission();
//     if (permission == LocationPermission.denied) {
//       return Future.error('Location permissions are denied');
//     }
//   }

//   if (permission == LocationPermission.deniedForever) {
//     return Future.error('Location permissions are permanently denied.');
//   }

//   return await Geolocator.getCurrentPosition();
// }

// Future<String> getAddressFromLatLng(Position position) async {
//   List<Placemark> placemarks = await placemarkFromCoordinates(
//     position.latitude,
//     position.longitude,
//   );
//   if (placemarks.isNotEmpty) {
//     final place = placemarks.first;
//     return '${place.street}, ${place.locality}, ${place.country}';
//   }
//   return 'Address not found';
// }

// Future<String> getAddress()async{
//   try{
//     Position position=await getCurrentPosition();
//   String address= await getAddressFromLatLng(position);
//   return address;
//   }catch(e){
//     return 'Null';
//   }
// }