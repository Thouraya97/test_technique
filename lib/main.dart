import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'locations.dart';
import 'package:geolocator/geolocator.dart';
import 'View2.dart';

void main() => runApp(MyApp());
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  GoogleMapController mapController;
Position _currentPosition;
String _currentAddress;
final Geolocator geolocator = Geolocator().forceAndroidLocationManager;
  final LatLng _center = const LatLng(45.521563, -122.677433);


 
  

   @override
  void initState() {
    super.initState();
   // _getCurrentLocation();
  }
  final Map<String, Marker> _markers = {};
  Future<void> _onMapCreated(GoogleMapController controller) async {
    final carLocations = await Data.getCarData();
    setState(() {
      _markers.clear();
      for (final data in carLocations.Data) {
        final marker = Marker(
          markerId: MarkerId(Data.carId),
          position: LatLng(Data.lat, Data.lon),
          infoWindow: InfoWindow(
            
            title: Data.title,
            lat: Data.lat,
            lon: Data.lon,
            
      
          ),
        );
        _markers[Data.title] = marker;
      }
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
            onTap: Navigator.push(context,
                      MaterialPageRoute(builder: (context) => View2(
                          name: Data.name,
                          lat:Data.lat,
                          carId:Data.carId,
                            title:Data.title,
                            lon:Data.lon,
                            vehicleTypeImageUrl:Data.vehicleTypeImageUr,
                            damageDescription:Data.damageDescription, 
                            reservationState:Data.reservationState,
                            isClean:Data.isClean,
                           isDamaged:Data.isDamaged,
                        licencePlate:Data.licencePlate,
                      fuelLevel:Data.fuelLevel,
                        hardwareId:Data.hardwareId,
                          vehicleTypeId :Data.vehicleTypeId,
                        pricingTime:Data.pricingTime,
                      pricingParking:Data.pricingParking,
                      )));
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
