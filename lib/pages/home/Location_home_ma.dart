import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class Location_C extends StatefulWidget {
  const Location_C({Key? key}) : super(key: key);

  @override
  State<Location_C> createState() => _Location_CState();
}

class _Location_CState extends State<Location_C> {

  String stAdd = '';



void initState(){
  super.initState();
  _getCurrentLocation();
}
  @override
 

  Future<void> _getCurrentLocation() async {
    try {
                Position position = await Geolocator.getCurrentPosition(
                  desiredAccuracy: LocationAccuracy.high,
                );
                List<Placemark> placemarks = await placemarkFromCoordinates(
                  position.latitude,
                  position.longitude,
                );

                setState(() {
                  stAdd = 
                      placemarks.first.locality! +
                      ", " +
                      placemarks.first.country!;
                });
              } catch (e) {
                print('Error getting current location: $e');
                setState(() {
        stAdd = 'Location not available'; // Set a default message
      });
              }
            }

 Widget build(BuildContext context) {
    return stAdd == null
        ? CircularProgressIndicator() // Show loading indicator while fetching location
        : Text(
            stAdd!,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          );
  }
          
  }

