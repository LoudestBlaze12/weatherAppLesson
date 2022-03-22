import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart';


// class Location {
//
//   double latitude;
//   double longitude;
//   Position position;
//
//   Future <void> getCurrentLocation () async {
//
//     try {
//       LocationPermission permission = await Geolocator.requestPermission();
//       print(permission);
//
//       bool isLocationServiceEnabled  = await Geolocator.isLocationServiceEnabled();
//       print(isLocationServiceEnabled);
//       print(defaultTargetPlatform);
//
//       Position myPost =   await posit();
//
//
//
//       // Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low,
//       // timeLimit: Duration(seconds: 30),
//       // forceAndroidLocationManager: true);
//
//       // Position position = await Geolocator.getCurrentPosition(
//       //   desiredAccuracy: LocationAccuracy.low ,
//       //   timeLimit: Duration(seconds: 10),
//       //
//       // );
//
//       latitude = position.latitude;
//       longitude = position.longitude;
//
//       // print(position);
//       // getGpsLocation();
//
//       print("Permission checked");
//
//
//
//     }
//     catch (e) {
//       print(e);
//       print("Hello my old friend the gps is broken");
//
//     }
//
//
//     // try {
//     //
//     //
//     // }
//     // catch (e) {
//     //   print(e);
//     // }
//     //
//     // print("Money on my mind");
//
//   }
//
//   // Future<void> getGpsLocation () async {
//   //
//   //   try {
//   //     Position position = await Geolocator.getCurrentPosition(
//   //       desiredAccuracy: LocationAccuracy.low ,
//   //       timeLimit: Duration(seconds: 10),
//   //
//   //     );
//   //
//   //     latitude = position.latitude;
//   //     longitude = position.longitude;
//   //
//   //     print("Location checkpoint");
//   //   }
//   //   catch (e) {
//   //     print("we have failed in life");
//   //   }
//   // }
//
//   /// Determine the current position of the device.
//   ///
//   /// When the location services are not enabled or permissions
//   /// are denied the `Future` will return an error.
//
//
//   Future<Position> posit() async {
//     Future<Position> _determinePosition() async {
//       bool serviceEnabled;
//       LocationPermission permission;
//       print("post working");
//
//       // Test if location services are enabled.
//       serviceEnabled = await Geolocator.isLocationServiceEnabled();
//       if (!serviceEnabled) {
//         // Location services are not enabled don't continue
//         // accessing the position and request users of the
//         // App to enable the location services.
//         return Future.error('Location services are disabled.');
//       }
//
//       permission = await Geolocator.checkPermission();
//       if (permission == LocationPermission.denied) {
//         permission = await Geolocator.requestPermission();
//         if (permission == LocationPermission.denied) {
//           // Permissions are denied, next time you could try
//           // requesting permissions again (this is also where
//           // Android's shouldShowRequestPermissionRationale
//           // returned true. According to Android guidelines
//           // your App should show an explanatory UI now.
//           return Future.error('Location permissions are denied');
//         }
//       }
//
//       if (permission == LocationPermission.deniedForever) {
//         // Permissions are denied forever, handle appropriately.
//         return Future.error(
//             'Location permissions are permanently denied, we cannot request permissions.');
//       }
//
//       // When we reach here, permissions are granted and we can
//       // continue accessing the position of the device.
//       return await Geolocator.getCurrentPosition(timeLimit: Duration(seconds: 15),
//       forceAndroidLocationManager: true);
//     }
//     return _determinePosition();
//   }
//
//
//
//
// }
class LocationFinder {
  void locationGrabber() async {
    Location location = new Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();
    print(_locationData);
  }
  }

