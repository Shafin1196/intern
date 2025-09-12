import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geocoding/geocoding.dart';
import 'package:intern/homeScreens/detail_page2.dart';
import 'package:intern/models/parcel.dart';
import 'package:intern/providers/parcel_providers.dart';
import 'package:latlong2/latlong.dart';

Future<String> getAddress(double lat, double lng) async {
  try {
    List<Placemark> placemarks = await placemarkFromCoordinates(lat, lng);
    if (placemarks.isNotEmpty) {
      final place = placemarks.first;
      return "${place.street}, ${place.locality}, ${place.country}";
    } else {
      return "Unknown location";
    }
  } catch (e) {
    return "Unknown location";
  }
}

class ChooseLocation extends ConsumerStatefulWidget {
  const ChooseLocation({super.key});

  @override
  ConsumerState<ChooseLocation> createState() {
    return _ChooseLocationState();
  }
}

class _ChooseLocationState extends ConsumerState<ChooseLocation> {
  bool isLoading = false;
  bool _pickUpLoaction = false;
  bool _destinationLocation = false;
  LatLng? pickUpLatLng;
  LatLng? destinationLatLng;
  String pickUpAddress = '';
  String destinationAddress = '';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              setState(() {
                _pickUpLoaction = true;
              });
            },
            child: Card(
              color: Colors.white,
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.grey.shade200,
                  child: Icon(Icons.my_location, color: Colors.green.shade700),
                ),
                title: Text('Pick up location',
                    style:
                        TextStyle(fontSize: 14, color: Colors.grey.shade600)),
                subtitle: Text(pickUpAddress.isEmpty?"select pick up location":pickUpAddress,
                    overflow: TextOverflow.fade,
                    style:
                        TextStyle(fontSize: 16, color: Colors.black)),
                trailing: Icon(Icons.arrow_downward_outlined,
                    size: 16, color: Colors.black),
                onTap: () {
                  setState(() {
                    _pickUpLoaction = true;
                  });
                },
              ),
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                _pickUpLoaction = true;
                _destinationLocation = false;
              });
            },
            child: Card(
              color: Colors.white,
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.grey.shade200,
                  child: Icon(Icons.location_on, color: Colors.green.shade700),
                ),
                title: Text('Destination',
                    style:
                        TextStyle(fontSize: 14, color: Colors.grey.shade600)),
                subtitle: Text(destinationAddress.isEmpty?"select destination location":destinationAddress,
                    overflow: TextOverflow.fade,
                    style: TextStyle(fontSize: 16, color: Colors.black)),
                trailing: Icon(Icons.arrow_downward_outlined,
                    size: 16, color: Colors.black),
                onTap: () {
                  setState(() {
                    _destinationLocation = true;
                    _pickUpLoaction = false;
                  });
                },
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 280,
            width: MediaQuery.of(context).size.width - 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.white12),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: FlutterMap(
                options: MapOptions(
                    initialCenter: LatLng(51.5, -0.09),
                    initialZoom: 1,
                    interactionOptions:
                        InteractionOptions(flags: InteractiveFlag.all),
                    onTap: (tapPosition, latlng) async{
                      
                        if (_pickUpLoaction) {
                          setState(() {
                            _pickUpLoaction = true;
                          _destinationLocation = false;
                          pickUpLatLng = latlng;
                          });
                          String addr= await getAddress(latlng.latitude, latlng.longitude);
                          setState(() {
                            pickUpAddress = addr;
                          });
                        } else if (_destinationLocation) {
                          setState(() {
                            _destinationLocation = true;
                            _pickUpLoaction = false;
                            destinationLatLng = latlng;
                          });
                          String addr = await getAddress(latlng.latitude, latlng.longitude);
                          setState(() {
                            destinationAddress = addr;
                          });
                        }
                      
                    }),
                children: [
                  OpenStreetMapTileLayer,
                  if (pickUpLatLng != null && destinationLatLng != null)
                    MarkerLayer(
                      markers: [
                        Marker(
                          width: 80,
                          height: 80,
                          point: pickUpLatLng!,
                          child: Icon(
                            Icons.my_location,
                            color: Colors.red.shade700,
                            size: 40,
                          ),
                        ),
                        Marker(
                          width: 80,
                          height: 80,
                          point: destinationLatLng!,
                          child: Icon(
                            Icons.location_on,
                            color: Colors.red.shade700,
                            size: 40,
                          ),
                        ),
                      ],
                    ),
                  if (pickUpLatLng != null)
                    MarkerLayer(
                      markers: [
                        Marker(
                          width: 80,
                          height: 80,
                          point: pickUpLatLng!,
                          child: Icon(
                            Icons.my_location,
                            color: Colors.red.shade700,
                            size: 40,
                          ),
                        ),
                        
                      ],
                    ),
                  if (destinationLatLng != null )
                    MarkerLayer(
                      markers: [
                        Marker(
                          width: 80,
                          height: 80,
                          point: destinationLatLng!,
                          child: Icon(
                            Icons.location_on,
                            color: Colors.red.shade700,
                            size: 40,
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width - 40,
            height: 47,
            child: ElevatedButton(
              onPressed: () {
                if(pickUpLatLng==null || destinationLatLng==null){
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Please select both pick up and destination locations.'),
                      backgroundColor: Colors.red,
                    ),
                  );
                  return;
                }
                setState(() {
                  isLoading = true;
                });
                final  pickUp= LocationPoint(
                  type: "point",
                  address: pickUpAddress,
                  coordinates: [pickUpLatLng!.latitude, pickUpLatLng!.longitude],
                );
                final destination=LocationPoint(
                  type: "point",
                  address: destinationAddress,
                  coordinates: [destinationLatLng!.latitude, destinationLatLng!.longitude],
                );
                ref.read(parcelProvider.notifier).setParcelLocation(pickUp, destination);
                setState(() {
                  isLoading = false;
                });
                // ref.read(parcelProvider.notifier).printState();
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => DetailPage2()),
                );
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade700,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25))),
              child: isLoading
                  ? CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    )
                  : Text(
                      "Confirm location",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}

TileLayer get OpenStreetMapTileLayer => TileLayer(
      urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
      userAgentPackageName: 'dev.fleaflet.flutter_map.example',
    );
