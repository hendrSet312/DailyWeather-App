import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/pages/main_page.dart';

class WelcomePage extends StatelessWidget{
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'lib/assets/weather_icon/cloudy_with_rain_light.svg',
              height: 90,
              width: 90,
            ),
            const SizedBox(height: 6,),
            const Text('Welcome to DailyWeather',style: TextStyle(fontSize: 24),),
            const SizedBox(height: 2,),
            const Text('Always prepare, rain or shine', style: TextStyle(fontSize: 16, color: Colors.black45),),
            const SizedBox(height: 16,),
            TextButton(
              onPressed:() {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const WeatherList()),
              );
            },
              style: TextButton.styleFrom(
                backgroundColor: Colors.blue[50]
              ),
              child: const Text('Let\'s Start !', style: TextStyle(fontSize: 16),),
            )
          ],
        )
      ),
    );
  }
}