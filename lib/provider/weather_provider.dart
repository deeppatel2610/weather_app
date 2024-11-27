
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/Api%20Helper/Api_helper.dart';
import 'package:weather_app/modal/weather_modal.dart';

class WeatherProvider extends ChangeNotifier
{
  ApiHelper apiHelper = ApiHelper();
  WeatherModal? weatherModal;
  List<String> weather = [];
  String search = 'surat';
  Future<WeatherModal?> fromMap()
  async {
    final data = await apiHelper.fetchData(search);
    weatherModal = WeatherModal.fromJson(data);
    return weatherModal;
  }
  void citySearch(String value)
  {
    search = value;
    notifyListeners();
  }

  Future<void> addToFavourite(String name,String status, String temp,String icon)
  async {
    String data = "$name-$status-$temp-$icon";
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    weather.add(data);
    // weather.clear();
    sharedPreferences.setStringList('weather', weather);

  }

  Future<void> getFavouriteWeather()
  async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    weather = sharedPreferences.getStringList('weather') ?? <String>[];
    print(weather);
    notifyListeners();
  }

  WeatherProvider()
  {
    print(weather);
    getFavouriteWeather();
  }
}
