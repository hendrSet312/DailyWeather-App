import 'package:flutter/material.dart';
import 'package:weather_app/assets/use_image.dart';
import 'package:weather_app/pages/detail_page.dart';
import 'package:weather_app/data/data_cities.dart';

class WeatherList extends StatefulWidget{
  const WeatherList({super.key});

  @override
  _WeatherListState createState() => _WeatherListState();
}



class _WeatherListState extends State<WeatherList> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Daily Weather'),
        ),
      ),
      body: Container(
        child: Center(
          child: ListView.builder(
            itemCount: cities.length,
            itemBuilder: (context, index){
              final item = cities[index];
              return GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailPage(
                        cityDetails: item,
                      ),
                    ),
                  );
                },
                child: Container(
                width: MediaQuery.of(context).size.width,
                height: 150,
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.black45,
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image : AssetImage(item['image_link']!),
                      colorFilter: ColorFilter.mode(
                        Colors.black38.withOpacity(0.3),
                        BlendMode.darken
                      ),
                      fit: BoxFit.cover,
                    ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0) ,
                  child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [ 
                        Text(
                          item['Name']!, style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white , shadows: [Shadow(blurRadius: 3, offset: Offset(1.0, 1.0),)]),
                       ),
                        const SizedBox(height: 4),
                        Text(
                          item['Country']!, style: const TextStyle(fontSize: 15,color: Colors.white,shadows: [Shadow(blurRadius: 3, offset: Offset(1.0, 1.0),)])
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              item['Weather']!, style: const TextStyle(fontSize: 20,color: Colors.white, shadows: [Shadow(blurRadius: 3, offset: Offset(1.0, 1.0),)]),
                            ),
                            const SizedBox(width: 5,),
                            getWeatherIcon(item['Weather']!)
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '${item['Temperature']}°C', style: const TextStyle(fontSize: 16,color: Colors.white, shadows: [Shadow(blurRadius: 3, offset: Offset(1.0, 1.0),)]),
                        )
                      ],
                    )
                  ],
                )

                )
              ),
              );
            },
          ),
        ),
      ),
    );
}}
