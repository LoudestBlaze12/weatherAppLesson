import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';


class LocationPermission {

  //Initialize variables
  double latitude;
  double longitude;

  Future<void> permissionChecker() async {

    //Creates a Location Object
    Location location = new Location();

    //Setups some private variables
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
    latitude = _locationData.latitude;
    longitude = _locationData.longitude;
  }
  }

