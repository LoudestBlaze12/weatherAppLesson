import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:clima/services/location_finder.dart';


class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  LocationFinder locator = LocationFinder();


  static const String apiKey = "ed2d710f4d52137bc9e6e8ffa89cc926";



  double latitude;
  double longitude;
  String apiUrl = "";

  @override
  void initState() {
    orderOfContent();
    super.initState();
  }

  void orderOfContent() async {
    await getLocation();
    getLocalData();
    // await getData();
  }


  void getLocation() async {
    await locator.locationGrabber();

    latitude = locator.latitude;
    longitude = locator.longitude;
    apiUrl =  "https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey";
  }

  void getLocalData () async {
    networkHelper networkBrain = networkHelper(apiUrl);
    networkBrain.getData();
  }

  // void getData() async{
  //
  // Response apiResponse =  await get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey')
  // );
  //
  // // print(apiResponse.body);
  //
  //
  // if (apiResponse.statusCode == 200) {
  //
  //   String data = apiResponse.body;
  //   var decodedData = jsonDecode(data);
  //
  //   var cityName = decodedData['name'];
  //   double temp = decodedData['main']['temp'];
  //   int weather = decodedData['weather'][0]['id'];
  //
  //
  //   print(cityName);
  //   print(temp);
  //   print(weather);
  //
  //
  //
  // }
  //
  // else {
  //
  // }
  //
  //
  //
  // }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: () {
            getLocation();
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
