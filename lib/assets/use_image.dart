import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget getWeatherIcon(String weather){
  switch (weather) {
    case 'Rainy' : 
      return SvgPicture.asset('lib/assets/weather_icon/showers_rain.svg');
    case 'Cloudy' : 
      return SvgPicture.asset('lib/assets/weather_icon/cloudy.svg');
    case 'Sunny' : 
      return SvgPicture.asset('lib/assets/weather_icon/clear_day.svg');
    case 'Partly Sunny' : 
      return SvgPicture.asset('lib/assets/weather_icon/partly_cloudy_day.svg');
    case 'Snowy' : 
      return SvgPicture.asset('lib/assets/weather_icon/showers_snow.svg');
    case 'Light Snow' : 
      return SvgPicture.asset('lib/assets/weather_icon/icy.svg');
    default:
      return SvgPicture.asset('');
  }
}