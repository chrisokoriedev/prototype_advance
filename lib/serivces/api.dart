import 'package:dio/dio.dart';
import 'package:prototype_advance/model/apimodel.dart';

class WeatherApi {
  var endpoint = 'https://yahoo-weather5.p.rapidapi.com/weather';
  final Dio dio = Dio();
  Future getWeatherApi() async {
    var apiRequest = await dio.get(
      endpoint,
      queryParameters: {'location': 'ibadan'},
      options: Options(headers: {
        'X-RapidAPI-Key': 'f3517d0079mshab66d20c2d4c63bp180400jsna5343bc48b7c',
        'X-RapidAPI-Host': 'yahoo-weather5.p.rapidapi.com',
      }),
    );
    if (apiRequest.statusCode == 200) {
      final data = apiRequest.data;
      final WeatherApiModel weatherApiModel = WeatherApiModel.fromJson(data);
      return weatherApiModel;
    } else {
      return null;
    }
  }
}
