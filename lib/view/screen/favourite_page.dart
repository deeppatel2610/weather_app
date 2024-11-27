import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/weather_provider.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({super.key});

  @override
  Widget build(BuildContext context) {
    var weatherTrue = Provider.of<WeatherProvider>(context, listen: true);
    var weatherFalse = Provider.of<WeatherProvider>(context, listen: false);
    return Scaffold(
        body: Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/23dQ-ezgif.com-crop.gif'))),
      child: ListView.builder(
        itemBuilder: (context, index) {
          // final weatherData = weatherTrue.weather[index].split(' ').sublist(0,1).join(' ');
          final name = weatherTrue.weather[index].split('-').sublist(0,1).join('-');
          final status = weatherTrue.weather[index].split('-').sublist(1,2).join('-');
          final temp = weatherTrue.weather[index].split('-').sublist(2,3).join('-');
          final icon = weatherTrue.weather[index].split('-').sublist(3,4).join('-');
          return Card(
            color: Colors.transparent,
            shape: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            child: ListTile(
              title: Text(
                '${name}',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              subtitle: Text('${status}',
                  style: TextStyle(fontSize: 18, color: Colors.white)),
              leading: Image.network('https:${icon}'),
              trailing: Text(
                '${temp}°c',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          );
        },
        itemCount: weatherFalse.weather.length,
      ),
    ));
  }
}
