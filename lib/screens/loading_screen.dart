import 'dart:convert';
import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:clima/services/location_finder.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  //Initialize all constant and necessary variables
  LocationPermission locator = LocationPermission();
  static const String apiKey = "ed2d710f4d52137bc9e6e8ffa89cc926";
  String apiUrl = "";

  @override
  void initState() {
    orderOfContent();
    super.initState();
  }

  //Controls the order functions are executed
  void orderOfContent() async {
    await getLocation();
    getLocalData();

  }

  //Generates url string to pass to api call
  void getLocation() async {
    //asks for location permissions
    await locator.permissionChecker();
    apiUrl =  "https://api.openweathermap.org/data/2.5/weather?lat=${locator.latitude}&lon=${locator.longitude}&appid=$apiKey";
  }


  //Calls networking protocols to fetch JSON data from api call
  //then push navigation to load the Location Page

  void getLocalData () async {
    NetworkHelper networkBrain = NetworkHelper(apiUrl);
    await networkBrain.getData();

    var data = networkBrain.decodedData;
    String city = jsonDecode(data)['name'];
    double temp =  jsonDecode(data)['main']['temp'];
    double weather =  jsonDecode(data)['weather'][0]['id'];

    print(city);
    print(temp);
    print(weather);

    // Navigator.push(context, MaterialPageRoute(builder: (context) {
    //  return LocationScreen(liveCity: city,liveTemp: temp,liveWeather: weather,);
    // }));

  }


  //Creates a loading animation
  final spinKit = SpinKitRotatingCircle(
    color: Colors.white,
    size: 50.0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: spinKit,
    );
  }
}

