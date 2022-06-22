import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timer_builder/timer_builder.dart';
import 'package:intl/intl.dart';
import "package:weather_app/model/model.dart";

class WeatherScreen extends StatefulWidget {
  final dynamic parseData;
  final dynamic parseDataAir;
  const WeatherScreen({
    Key? key, 
    this.parseData,
    this.parseDataAir,
  }) : super(key: key);

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}


class _WeatherScreenState extends State<WeatherScreen> {
  Model model = Model();
  String? city;
  String weather = '';
  int temperature = 0;
  var id = 0;
  var sunrise = 0;
  var sunset = 0;

  int aqi = 0;
  dynamic pm1 = 0.0;
  dynamic pm2 = 0.0;


  var date = DateTime.now();

  @override
  void initState() {
    super.initState();
    updateData(widget.parseData, widget.parseDataAir);
  }

  String getSystemTime(){
    var now = DateTime.now();
    return DateFormat("h:mm a").format(now);
  }

  void updateData(dynamic newParsingData, dynamic newParsingDataAir){
    city = newParsingData["name"];
    weather = newParsingData["weather"][0]["description"];
    temperature = newParsingData["main"]["temp"].round();
    id = newParsingData["weather"][0]["id"];
    sunrise = newParsingData["sys"]["sunrise"];
    sunset = newParsingData["sys"]["sunset"];

    aqi = newParsingDataAir["list"][0]["main"]["aqi"];
    pm1 = newParsingDataAir["list"][0]["components"]["pm10"];
    pm2 = newParsingDataAir["list"][0]["components"]["pm2_5"];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,

        leading: IconButton(
          icon: const Icon(
            Icons.near_me,
            size: 30.0,
          ),
          onPressed: (){
            updateData(widget.parseData, widget.parseDataAir);
          },
        ),

        actions: [
          IconButton(
            icon: const Icon(
              Icons.location_searching,
              size: 30.0,
            ),
            onPressed: (){
              updateData(widget.parseData, widget.parseDataAir);
            },
          ),
        ],
      ),

      body: Container(
        child: Stack(
          children: [
            Image.asset(
              "img/background.jpg",
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),

            Container(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 150,
                            ),
                  
                            Text(
                              "",
                              style: GoogleFonts.lato(
                                fontSize: 35.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                  
                            Row(
                              children: [
                                TimerBuilder.periodic(
                                  const Duration(minutes: 1),
                                  builder: (context){
                                    return Text(
                                      getSystemTime(),
                                      style: GoogleFonts.lato(
                                        fontSize: 16.0,
                                        color: Colors.white,
                                      ),
                                    );
                                  },
                                ),
                  
                                Text(
                                  DateFormat(" - EEEE").format(date),
                                  style: GoogleFonts.lato(
                                    fontSize: 16.0,
                                    color: Colors.white,
                                  ),
                                ),
                  
                                Text(
                                  DateFormat("d MMM, yyy").format(date),
                                  style: GoogleFonts.lato(
                                    fontSize: 16.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                  
                  
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "$temperature\u2103",
                              style: GoogleFonts.lato(
                                fontSize: 85.0,
                                fontWeight: FontWeight.w300,
                                color: Colors.white,
                              ),
                            ),

                            Row(
                              children: [
                                model.getWeatherImg(id, sunrise, sunset),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                Text(
                                  weather,
                                  style: GoogleFonts.lato(
                                    fontSize: 16.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
              
                  Column(
                    children: [
                      const Divider(
                        height: 15.0,
                        thickness: 2.0,
                        color: Colors.white30,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Text(
                                "AQI(대기질 지수)",
                                style: GoogleFonts.lato(
                                  fontSize: 14.0,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              getAirImg(aqi),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                getAirText(aqi),
                                style: GoogleFonts.lato(
                                  fontSize: 14.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 50.0,
                          ),
                          Column(
                            children: [
                              Text(
                                "미세먼지",
                                style: GoogleFonts.lato(
                                  fontSize: 14.0,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(
                                height: 35.0,
                              ),
                              Text(
                                "$pm1",
                                style: GoogleFonts.lato(
                                  fontSize: 24.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 35.0,
                              ),
                              Text(
                                "㎛/㎥",
                                style: GoogleFonts.lato(
                                  fontSize: 14.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 50.0,
                          ),
                          Column(
                            children: [
                              Text(
                                "초미세먼지",
                                style: GoogleFonts.lato(
                                  fontSize: 14.0,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(
                                height: 35.0,
                              ),
                              Text(
                                "$pm2",
                                style: GoogleFonts.lato(
                                  fontSize: 24.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 35.0,
                              ),
                              Text(
                                "㎛/㎥",
                                style: GoogleFonts.lato(
                                  fontSize: 14.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}