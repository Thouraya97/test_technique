import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';

class Data {
  final String carId;
  final String title;
  final bool isClean;
  final bool isDamaged;
  final String licencePlate;
  final int fuelLevel;
  final String hardwareId;
  final int vehicleTypeId;
  final String pricingTime;
  final String pricingParking;
  final double lat;
  final double lon;
  final int reservationState;
  final String damageDescription;
  final String vehicleTypeImageUrl;
  Data({
    this.carId,
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
    this.vehicleTypeImageUrl,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
        carId: json['carId'],
        title: json['title'],
        lat: json['lat'],
        lon: json['lon'],
        vehicleTypeImageUrl: json['vehicleTypeImageUrl'],
        damageDescription: json['damageDescription'],
        reservationState: json['reservationState'],
        isClean: json['isClean'],
        isDamaged: json['isDamaged'],
        licencePlate: json['licencePlate'],
        fuelLevel: json['fuelLevel'],
        hardwareId: json['hardwareId'],
        vehicleTypeId: json['vehicleTypeId'],
        pricingTime: json['pricingTime'],
        pricingParking: json['pricingParking']);
  }
  Map<String, dynamic> toJson() => {
        'lat': lat,
        'carId': carId,
        'title': title,
        'lon': lon,
        'vehicleTypeImageUrl': vehicleTypeImageUrl,
        'damageDescription': damageDescription,
        'reservationState': reservationState,
        'isClean': isClean,
        'isDamaged': isDamaged,
        'licencePlate': licencePlate,
        'fuelLevel': fuelLevel,
        'hardwareId': hardwareId,
        'vehicleTypeId': vehicleTypeId,
        'pricingTime': pricingTime,
        'pricingParking': pricingParking,
      };
  Future<Data> getCarData() async {
    const googleLocationsURL = 'http://demo2870336.mockable.io/data';

    // Retrieve the locations of Google offices
    final response = await http.get(googleLocationsURL);
    if (response.statusCode == 200) {
      return Data.fromJson(json.decode(response.body));
    } else {
      throw HttpException(
          'Unexpected status code ${response.statusCode}:'
          ' ${response.reasonPhrase}',
          uri: Uri.parse(googleLocationsURL));
    }
  }
}
