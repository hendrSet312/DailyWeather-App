import 'package:flutter/material.dart';
import 'package:weather_app/assets/use_image.dart';

class DetailPage extends StatefulWidget{
  final cityDetails ;

  const DetailPage({super.key, required this.cityDetails});

  @override
  _DetailPageState createState() => _DetailPageState();
}

dynamic CardAnalytics(String typeData, dynamic value, String metrics) {
  return Expanded(
    child: LayoutBuilder(
      builder: (context, constraints) {
        final double screenWidth = constraints.maxWidth;
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.black38, width: 0.6),
            color: Colors.white, 
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  typeData,
                  style: TextStyle(
                    fontSize: screenWidth * 0.06,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      value.toString(),
                      style: TextStyle(
                        fontSize: screenWidth * 0.10, 
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(metrics,style: TextStyle(fontSize: screenWidth * 0.06))
                  ],
                ),
              ],
            ),
          ),
        );
      },
    ),
  );
}

Widget ForecastCard(List forecastData, double screenWidth) {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    physics: const AlwaysScrollableScrollPhysics(), // Ensures scrolling is always possible
    child: Row(
      children: forecastData.map((hourlyData) {
        return Container(
          width: screenWidth > 600 ? 240 : 150,
          height: 150,
          margin: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            color: Colors.blue[50],
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black26)
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '${hourlyData['hour']}',
                  style: TextStyle(
                    fontSize: (screenWidth * 0.02).clamp(14.0, 20.0),
                    fontWeight: FontWeight.bold
                  ),
                ),
                getWeatherIcon(hourlyData['Weather']),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center ,
                  children: [
                    Text(hourlyData['Weather'], style: TextStyle(fontWeight: FontWeight.bold),),
                    SizedBox(width: 5,),
                    Text(',${hourlyData['Temperature']} °C',)
                  ],
                )
              ],
            ),
          ),
        );
      }).toList(),
    ),
  );
}


class _DetailPageState extends State<DetailPage> {

  Widget _buildWideLayout(List<Widget> cards) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: cards,
    );
  }

  Widget _buildNarrowLayout(List<Widget> cards) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: cards.sublist(0, 2),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: cards.sublist(2),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {

    final List<Widget> analyticsCards = [
      CardAnalytics('🌡️ Temperature', widget.cityDetails['Temperature'], '°C'),
      CardAnalytics('🍃 Wind', widget.cityDetails['Wind'], 'km/h'),
      CardAnalytics('💨 Pressure', widget.cityDetails['Pressure'], 'hPa'),
      CardAnalytics('😷 Air Quality', widget.cityDetails['AQI'], 'AQI'),
    ];
  
  
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.cityDetails['Name'])
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Container(
            height: 200,
            width: screenWidth,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(widget.cityDetails['image_link']),fit: BoxFit.cover)
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: 
                    Row(
                      children: [
                        getWeatherIcon(widget.cityDetails['Weather']),
                        const SizedBox(width: 10,),
                        Text('${widget.cityDetails['Weather']} (${widget.cityDetails['Temperature']} °C)', style:  TextStyle(fontSize: (screenWidth * 0.045).clamp(20.0, 24.0), fontWeight: FontWeight.bold)),
                        const SizedBox(width: 10,),
                        Text('Today', style:  TextStyle(fontSize:( screenWidth * 0.02).clamp(20.0, 24.0), color: Colors.black45)),
                      ],
                    )
                )
            ],
          ),
          screenWidth > 600 ? _buildWideLayout(analyticsCards) : _buildNarrowLayout(analyticsCards),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Hourly Forecast', style: TextStyle(fontSize: (screenWidth * 0.02).clamp(20.0, 24.0) ))
                  ]
                ),
              ],
            ),
          ),
          ForecastCard(widget.cityDetails['hourly_forecast'],screenWidth),
          const SizedBox(height: 30,),
        ],
      ),
    );
  }
  
}

