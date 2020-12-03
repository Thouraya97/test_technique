import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'Model.dart';
import 'package:geolocator/geolocator.dart';
import 'View2.dart';

void main() => runApp(MyApp());
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  GoogleMapController mapController;
  Data data ;
Position _currentPosition;
String _currentAddress;
final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
  final LatLng _center = const LatLng(45.521563, -122.677433);


 
  

   @override
  void initState() {
    super.initState();
   // _getCurrentLocation();
  }
  final Map<String, Marker> _markers = {};
  Future<void> _onMapCreated(GoogleMapController controller) async {
    final carLocations = await data.getCarData();
    setState(() {
      _markers.clear();
      data.forEach((Map<String,dynamic>data)) {
        final marker = Marker(
          markerId: MarkerId(data.carId),
          position: LatLng(data.lat, data.lon),
          infoWindow: InfoWindow(
            
            title: data.title,
            lat: data.lat,
            lon: data.lon,
            onTap: Navigator.push(context,
                      MaterialPageRoute(builder: (context) => View2(
                         
                          lat:data.lat,
                          carId:data.carId,
                            title:data.title,
                            lon:data.lon,
                            vehicleTypeImageUrl:data.vehicleTypeImageUrl,
                            damageDescription:data.damageDescription, 
                            reservationState:data.reservationState,
                            isClean:data.isClean,
                           isDamaged:data.isDamaged,
                        licencePlate:data.licencePlate,
                      fuelLevel:data.fuelLevel,
                        hardwareId:data.hardwareId,
                          vehicleTypeId :data.vehicleTypeId,
                        pricingTime:data.pricingTime,
                      pricingParking:data.pricingParking,
                      )))
            
      
          ),
        );
        _markers[data.title] = marker;
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Vue 1'),
          backgroundColor: Colors.red[700],
        ),
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 11.0,
            
          ),
           markers: _markers.values.toSet(),
        mapType: MapType.normal,
        tiltGesturesEnabled: true,
        compassEnabled: true,
        rotateGesturesEnabled: true,
        myLocationEnabled: true,
        ),
      ),
    );
  }
}
