import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/provider/weather_provider.dart';
import 'package:weather_app/view/screen/favourite_page.dart';
import 'package:weather_app/view/screen/home_page.dart';
// import 'package:weather_app/view/screen/spalsh_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => WeatherProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => HomePage(),
          '/fav': (context) => FavouritePage(),
        },
      ),
    );
  }
}
