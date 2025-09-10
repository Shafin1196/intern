import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';

class ChooseLocation extends ConsumerStatefulWidget {
  const ChooseLocation({super.key});

  @override
  ConsumerState<ChooseLocation> createState() {
    return _ChooseLocationState();
  }
}

class _ChooseLocationState extends ConsumerState<ChooseLocation> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text("pick 1 location"),
          Text("pick 2 location"),
          Container(
            height: 280,
            width: MediaQuery.of(context).size.width - 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.white12),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FlutterMap(
                options: MapOptions(
                    initialCenter: LatLng(51.5, -0.09),
                    initialZoom: 1,
                    interactionOptions: InteractionOptions(
                        flags: InteractiveFlag.all)),
                children: [
                  OpenStreetMapTileLayer,
                  MarkerLayer(markers: [
                    Marker(
                      width: 80.0,
                      height: 80.0,
                      point: LatLng(51.5, -0.09),
                      child: Icon(Icons.location_on, color: Colors.red, size: 40),
                    ),
                    Marker(
                      width: 80.0,
                      height: 80.0,
                      point: LatLng(52.5, -0.09),
                      child: Icon(Icons.location_on, color: Colors.red, size: 40),
                    ),
                  ]),
                  PolylineLayer(
      polylines: [
        Polyline(
          points: [
            LatLng(51.5, -0.09),
            LatLng(52.5, -0.09),
          ],
          color: Colors.blue,
          strokeWidth: 4,
        ),
      ],
    ),
                  
                ],
              ),
            ),
          ),
          const SizedBox(height: 20,),
          SizedBox(
            width: MediaQuery.of(context).size.width - 40,
            height: 47,
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  isLoading = true;
                });
                setState(() {
                  isLoading = false;
                });
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
                      "Continue",
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
