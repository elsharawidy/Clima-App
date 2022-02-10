import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


const spinkit = SpinKitDoubleBounce(
  color: Colors.white,
  size: 100.0,
);

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    getLocationData();
    super.initState();
  }

  void getLocationData() async {
    var weatherData = await WeatherModel().getLocationWeather();
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LocationScreen(weatherData)
   ));

  }

  void getData() async {


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child:spinkit ,),
    );
  }
}
