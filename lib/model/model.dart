import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Model{
  
  Widget getWeatherImg(int id, int sunrise, int sunset){
    int state = id ~/ 100;

    int unixTimeStamp = DateTime.now().millisecondsSinceEpoch;

    if(sunrise < unixTimeStamp && unixTimeStamp < sunset)
    {
      switch (state) {
        case 8:
          switch(id){
            case 800:
              return Image.asset(
                "img/01d.png"
              );
            case 801:
              return Image.asset(
                "img/02d.png"
              );
            case 802:
              return Image.asset(
                "img/03d.png"
              );
            default:
              return Image.asset(
                "img/04d.png"
              );
          }
        case 2:
          return Image.asset(
            "img/11d.png"
          );
        case 3:
          return Image.asset(
            "img/10d.png"
          );
        case 5:
          return Image.asset(
            "img/09d.png"
          );
        case 6:
          return Image.asset(
            "img/13d.png"
          );
        case 7:
          return Image.asset(
            "img/50d.png"
          );
        default:
          return Text(
            "?",
            style: GoogleFonts.lato(
              fontSize: 20.0,
              color : Colors.white,
            ),
          );
      }
    }
    else{
      switch (state) {
        case 8:
          switch(id){
            case 800:
              return Image.asset(
                "img/01n.png"
              );
            case 801:
              return Image.asset(
                "img/02n.png"
              );
            case 802:
              return Image.asset(
                "img/03n.png"
              );
            default:
              return Image.asset(
                "img/04n.png"
              );
          }
        case 2:
          return Image.asset(
            "img/11n.png"
          );
        case 3:
          return Image.asset(
            "img/10n.png"
          );
        case 5:
          return Image.asset(
            "img/09n.png"
          );
        case 6:
          return Image.asset(
            "img/13n.png"
          );
        case 7:
          return Image.asset(
            "img/50n.png"
          );
        default:
          return Text(
            "?",
            style: GoogleFonts.lato(
              fontSize: 20.0,
              color : Colors.white,
            ),
          );
      }
    }
  }
}

Widget getAirImg(int state){
  switch(state){
    case 1:
      return Image.asset(
        "img/good.png",
      );
    case 2:
      return Image.asset(
        "img/fair.png",
      );
    case 3:
      return Image.asset(
        "img/moderate.png",
      );
    case 4:
      return Image.asset(
        "img/poor.png",
      );
    case 5:
      return Image.asset(
        "img/bad.png",
      );
    default:
      return Text(
        "?",
        style: GoogleFonts.lato(
          fontSize: 20.0,
          color : Colors.white,
        ),
      );
  }
}

String getAirText(int state){
  switch(state){
    case 1:
      return "매우 좋음";
    case 2:
      return "좋음";
    case 3:
      return "보통";
    case 4:
      return "나쁨";
    case 5:
      return "매우 나쁨";
    default:
      return "알 수 없음";
  }
}