import 'package:flutter/material.dart';
import 'package:clima/services/location_brain.dart';


class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  LocationFinder locator = LocationFinder();

  @override
  void initState() {
    getLocation();
    super.initState();
  }


  void getLocation()  {
    locator.locationGrabber();

  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: () {
            // print(locator.longitude);
            // print(locator.latitude);
            //Get the current location
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }
}
