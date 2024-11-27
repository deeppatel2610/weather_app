import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/modal/weather_modal.dart';
import 'package:weather_app/provider/weather_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var weatherTrue = Provider.of<WeatherProvider>(context, listen: true);
    var weatherFalse = Provider.of<WeatherProvider>(context, listen: false);
    return Scaffold(
      body: FutureBuilder(
        future: Provider.of<WeatherProvider>(context, listen: false).fromMap(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            WeatherModal? weather = snapshot.data;
            return Stack(
              children: [
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: (weather!.currentModal.is_day == 1)
                          ? const AssetImage(
                              'assets/images/istockphoto-1007768414-612x612.jpg')
                          : const AssetImage("assets/images/HuGGeENt6kGyixe3hT9tnY-1200-80.jpg"),
                    ),
                  ),
                ),
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 15.0, top: 25),
                              child: Icon(
                                Icons.menu,
                                color: Colors.white,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 25.0),
                              child: Text(
                                '${weather!.locationModal.name}',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 15.0, top: 25),
                              child: InkWell(
                                onTap: () {
                                  weatherFalse.addToFavourite(
                                      weather.locationModal.name,
                                      weather.currentModal.condition.text,
                                      weather.currentModal.temp_c.toString(),
                                      weatherFalse.weatherModal!.currentModal
                                          .condition.icon);
                                  Navigator.of(context).pushNamed('/fav');
                                },
                                child: const Icon(
                                  Icons.favorite_border,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextField(
                                  style: TextStyle(
                                      color: (weather.currentModal.is_day == 1)
                                          ? Colors.white
                                          : Colors.white),
                                  controller: txtsearch,
                                  onSubmitted: (value) {
                                    weatherFalse.citySearch(value);
                                  },
                                  cursorColor:
                                      (weather.currentModal.is_day == 1)
                                          ? Colors.white
                                          : Colors.white,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.search,
                                        color:
                                            (weather.currentModal.is_day == 1)
                                                ? Colors.white
                                                : Colors.white),
                                    hintText: 'Search',
                                    hintStyle: TextStyle(
                                        color:
                                            (weather.currentModal.is_day == 1)
                                                ? Colors.white
                                                : Colors.white),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: const BorderSide(
                                        width: 2,
                                      ),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide(
                                          color:
                                              (weather.currentModal.is_day == 1)
                                                  ? Colors.white
                                                  : Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 80,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text:
                                            '${weather.currentModal.temp_c.toString()}',
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 60),
                                      ),
                                      WidgetSpan(
                                        child: Transform.translate(
                                          offset: Offset(0, -35),
                                          child: const Text(
                                            ' o',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15),
                                          ),
                                        ),
                                      ),
                                      WidgetSpan(
                                        child: Transform.translate(
                                          offset: Offset(0, -19),
                                          child: const Text(
                                            'c',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 35),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Text(
                                '${weather.currentModal.condition.text}',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 80,
                        ),
                        Container(
                          margin: const EdgeInsets.all(10),
                          height: 200,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: (weather.currentModal.is_day == 1)
                                  ? Color(0xff4E7197).withOpacity(0.8)
                                  : Color(0xff223150).withOpacity(0.8),
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.watch_later,
                                      size: 20,
                                      color: Colors.white70,
                                    ),
                                    Text(
                                      ' 24 - Hour Forecast',
                                      style: TextStyle(
                                          color: Colors.white70, fontSize: 18),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    ...List.generate(
                                      weather.forcatModal.forcastday.first.hour
                                          .length,
                                      (index) {
                                        final hour = weather.forcatModal
                                            .forcastday.first.hour[index];
                                        return Container(
                                          height: 120,
                                          width: 80,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                '${hour.time.split(" ").sublist(1, 2).join(" ")}',
                                                style: const TextStyle(
                                                  color: Colors.white70,
                                                  fontSize: 18,
                                                ),
                                              ),
                                              Image.network(
                                                  'https:${hour.hourConditionModal.icon}'),
                                              Text(
                                                '${hour.temp_c}',
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          height: 250,
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      height: 90,
                                      width: 200,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: (weather.currentModal.is_day ==
                                                1)
                                            ? Color(0xff4E7197).withOpacity(0.8)
                                            : Color(0xff223150)
                                                .withOpacity(0.8),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            '${weather.currentModal.wind_mph} mph',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w400),
                                          ),
                                          Text(
                                            '${weather.currentModal.wind_kph} kph',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w400),
                                          )
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      height: 90,
                                      width: 200,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: (weather.currentModal.is_day ==
                                                1)
                                            ? Color(0xff4E7197).withOpacity(0.8)
                                            : Color(0xff223150)
                                                .withOpacity(0.8),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text.rich(
                                            TextSpan(
                                              children: [
                                                TextSpan(
                                                  text:
                                                      '${weather.forcatModal.forcastday.first.astro.sunrise.split(" ").sublist(0, 1).join(" ")}',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20),
                                                ),
                                                TextSpan(
                                                    text: ' sunrise',
                                                    style: TextStyle(
                                                        color: Colors.white70,
                                                        fontSize: 20))
                                              ],
                                            ),
                                          ),
                                          Text.rich(
                                            TextSpan(
                                              children: [
                                                TextSpan(
                                                  text:
                                                      '${weather.forcatModal.forcastday.first.astro.sunset.split(" ").sublist(0, 1).join(" ")}',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20),
                                                ),
                                                TextSpan(
                                                    text: ' sunset',
                                                    style: TextStyle(
                                                        color: Colors.white70,
                                                        fontSize: 20))
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  height: 190,
                                  width: 180,
                                  decoration: BoxDecoration(
                                      color: (weather.currentModal.is_day == 1)
                                          ? Color(0xff4E7197).withOpacity(0.8)
                                          : Color(0xff223150).withOpacity(0.8),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0, vertical: 10),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Humidity',
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  color: Colors.white),
                                            ),
                                            Text(
                                                '${weather.currentModal.humidity}',
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.white)),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 3,
                                        ),
                                        Divider(
                                          height: 0.2,
                                          color: Colors.grey,
                                        ),
                                        SizedBox(
                                          height: 6,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'UV',
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  color: Colors.white),
                                            ),
                                            Text('${weather.currentModal.uv}',
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.white)),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 3,
                                        ),
                                        Divider(
                                          height: 0.2,
                                          color: Colors.grey,
                                        ),
                                        SizedBox(
                                          height: 6,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Pressure',
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  color: Colors.white),
                                            ),
                                            Text(
                                                '${weather.currentModal.pressure_mb}',
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.white)),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 3,
                                        ),
                                        Divider(
                                          height: 0.2,
                                          color: Colors.grey,
                                        ),
                                        SizedBox(
                                          height: 6,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Chance of rain',
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  color: Colors.white),
                                            ),
                                            Text(
                                                '${weather.forcatModal.forcastday.first.day.daily_chance_of_rain}%',
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.white)),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 3,
                                        ),
                                        Divider(
                                          height: 0.2,
                                          color: Colors.grey,
                                        ),
                                        SizedBox(
                                          height: 6,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text(
                                              'Pressure in',
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  color: Colors.white),
                                            ),
                                            Text(
                                              '${weather.currentModal.pressure_in}',
                                              style: const TextStyle(
                                                fontSize: 15,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('${snapshot}'),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

var txtsearch = TextEditingController();
