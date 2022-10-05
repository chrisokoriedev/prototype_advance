import 'package:get/get.dart';
import 'package:prototype_advance/model/apimodel.dart';
import 'package:prototype_advance/serivces/api.dart';

class WeatherApiController extends GetxController {
  var isLoading = true.obs;
  var data = WeatherApiModel(
    location: Location(
        city: '',
        country: '',
        lat: 0,
        long: 0,
        region: '',
        timezoneId: '',
        woeid: 0),
    currentObservation: CurrentObservation(
      wind: Wind(chill: 0, direction: 0, speed: 0),
      atmosphere:
          Atmosphere(humidity: 0, visibility: 0, pressure: 0, rising: 0),
      astronomy: Astronomy(sunrise: '', sunset: ''),
      condition: ConditionII(code: 0, text: 'text', temperature: 0),
      pubDate: 0,
    ),
    forecasts: [],
  ).obs;
  @override
  void onInit() {
    super.onInit();
    controlApi();
  }

  void controlApi() async {
    try {
      isLoading(true);
      WeatherApiModel weatherApiModel = await WeatherApi().getWeatherApi();
      data.value = weatherApiModel;
    } finally {
      isLoading(false);
    }
  }
}
