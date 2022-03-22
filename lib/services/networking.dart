import 'package:http/http.dart';
import 'dart:convert';

class networkHelper {

  networkHelper(this.url);

  String url;



  void getData() async{

    Response apiResponse =  await get(Uri.parse('$url')
    );

    // print(apiResponse.body);


    if (apiResponse.statusCode == 200) {

      String data = apiResponse.body;
      var decodedData = jsonDecode(data);

      var cityName = decodedData['name'];
      double temp = decodedData['main']['temp'];
      int weather = decodedData['weather'][0]['id'];


      print(cityName);
      print(temp);
      print(weather);



    }

    else {

    }



  }



}