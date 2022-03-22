import 'package:http/http.dart';
import 'dart:convert';

class NetworkHelper {

  NetworkHelper(this.url);

  String url;
  var decodedData;
  var cityName;
  double temp;
  int weather;


  void getData() async{

    //Makes call with string url
    Response apiResponse =  await get(Uri.parse('$url')
    );


    //Checks for errors, then decodes the JSON
    if (apiResponse.statusCode == 200) {

      String data = apiResponse.body;
      decodedData = jsonDecode(data);

      cityName = decodedData['name'];
      temp = decodedData['main']['temp'];
      weather = decodedData['weather'][0]['id'];


      print(cityName);
      print(temp);
      print(weather);



    }

    //prints status error is found
    else {
      print(apiResponse.statusCode);
    }


  }



}