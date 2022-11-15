// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import "package:weather_app/data/myLocation.dart";
import "package:weather_app/data/network.dart";
import 'package:weather_app/key.dart';
import "package:weather_app/screens/weather.dart";
import "package:flutter_spinkit/flutter_spinkit.dart";


class Loading extends StatefulWidget {
  const Loading({ Key? key }) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  double lat = 0.0;
  double lon = 0.0;


  void getLocation() async{
    MyLocation location = MyLocation();
    await location.getMyLocation();
    lat = location.lat;
    lon = location.lon;
    print(lat);
    print(lon);

    Network network = Network("https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apiKey&units=metric");
    Network network2 = Network("http://api.openweathermap.org/data/2.5/air_pollution/forecast?lat=$lat&lon=$lon&appid=$apiKey");
    var parsingData = await network.getJson();
    var parsingDataAir = await network2.getJson();
    print(parsingData);

    Navigator.push(context, MaterialPageRoute(builder: (context) => WeatherScreen(
      parseData: parsingData,
      parseDataAir: parsingDataAir,
    )));
  }
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SpinKitWanderingCubes(
          color: Colors.blue,
          size: 80.0,
        ),
      ),
    );
  }
}