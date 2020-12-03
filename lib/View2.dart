import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'Model.dart';
import 'package:geolocator/geolocator.dart';

class View2 extends StatelessWidget {
 View2({this.carId,
  this.title,
  this.isClean,
  this.isDamaged,
  this.licencePlate,
  this.fuelLevel,
   this.hardwareId,
    this.vehicleTypeId,
     this.pricingTime,
        this.pricingParking,
      this.lat,
       this.lon,
       this.reservationState,
        this.damageDescription, 
        this.vehicleTypeImageUrl,});


    final String carId;
  final String title;
  final bool isClean; 
  final bool isDamaged;
   final String licencePlate;
  final int fuelLevel;
    final String hardwareId ;
    final int  vehicleTypeId ;
      final String  pricingTime ;
        final String pricingParking ;
      final double  lat ;
       final double  lon ;
        final int reservationState ;
        final String damageDescription ;  
        final String vehicleTypeImageUrl;

  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Vue 2'),
          backgroundColor: Colors.red[700],
        ),
        body: Column(
         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(carId),
                    Text(title),
                    Text(isClean.toString()),
                    Text(isDamaged.toString()),
                    Text(licencePlate),
                    Text(fuelLevel.toString()),
                    Text(hardwareId),
                    Text(vehicleTypeId.toString()),
                    Text(pricingTime),
                    Text(pricingParking),
                     Text(lat.toString()),
                    Text(lon.toString()),
                     Text(reservationState.toString()),
                    Text(damageDescription),
                    

                    
                  ],
                ),
        )

      );
    
  }
}
