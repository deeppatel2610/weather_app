import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ApiHelper
{
   Future<Map> fetchData(String search)
   async {
      Uri url = Uri.parse('https://api.weatherapi.com/v1/forecast.json?key=383281ccefd5488a8bf100733243007&q=$search');

      Response response = await http.get(url);
      if(response.statusCode == 200)
         {
            final json =response.body;
            final Map data = jsonDecode(json);
            return data;
         }
      else
         {
            return{};
         }
   }

   // Future searchCity(String search)
   // async {
   //    Uri url = Uri.parse('https://api.weatherapi.com/v1/search.json?key=383281ccefd5488a8bf100733243007&q=$search');
   //    Response response = await http.get(url);
   //
   //    if(response.statusCode == 200)
   //       {
   //          return response.body;
   //       }
   //    else
   //       {
   //          return null;
   //       }
   // }
}