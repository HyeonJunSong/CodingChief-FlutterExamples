// ignore_for_file: avoid_print, file_names

import 'package:geolocator/geolocator.dart';

class MyLocation{
  double lat = 0.0;
  double lon = 0.0;

  Future<void> getMyLocation() async{
    try{
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      lat = position.latitude;
      lon = position.longitude;
    }
    catch(e){
      print("There was a problem with the GPS Connection");
    }
  }

}