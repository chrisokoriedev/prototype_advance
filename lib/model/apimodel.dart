

class WeatherApiModel {
    WeatherApiModel({
        required this.location,
        required this.currentObservation,
        required this.forecasts,
    });

    Location location;
    CurrentObservation currentObservation;
    List<Forecast> forecasts;

    factory WeatherApiModel.fromJson(Map<String, dynamic> json) => WeatherApiModel(
        location: Location.fromJson(json["location"]),
        currentObservation: CurrentObservation.fromJson(json["current_observation"]),
        forecasts: List<Forecast>.from(json["forecasts"].map((x) => Forecast.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "location": location.toJson(),
        "current_observation": currentObservation.toJson(),
        "forecasts": List<dynamic>.from(forecasts.map((x) => x.toJson())),
    };
}

class CurrentObservation {
    CurrentObservation({
        required this.wind,
        required this.atmosphere,
        required this.astronomy,
        required this.condition,
        required this.pubDate,
    });

    Wind wind;
    Atmosphere atmosphere;
    Astronomy astronomy;
    ConditionII condition;
    int pubDate;

    factory CurrentObservation.fromJson(Map<String, dynamic> json) => CurrentObservation(
        wind: Wind.fromJson(json["wind"]),
        atmosphere: Atmosphere.fromJson(json["atmosphere"]),
        astronomy: Astronomy.fromJson(json["astronomy"]),
        condition: ConditionII.fromJson(json["condition"]),
        pubDate: json["pubDate"],
    );

    Map<String, dynamic> toJson() => {
        "wind": wind.toJson(),
        "atmosphere": atmosphere.toJson(),
        "astronomy": astronomy.toJson(),
        "condition": condition.toJson(),
        "pubDate": pubDate,
    };
}

class Astronomy {
    Astronomy({
        required this.sunrise,
        required this.sunset,
    });

    String sunrise;
    String sunset;

    factory Astronomy.fromJson(Map<String, dynamic> json) => Astronomy(
        sunrise: json["sunrise"],
        sunset: json["sunset"],
    );

    Map<String, dynamic> toJson() => {
        "sunrise": sunrise,
        "sunset": sunset,
    };
}

class Atmosphere {
    Atmosphere({
        required this.humidity,
        required this.visibility,
        required this.pressure,
        required this.rising,
    });

    int humidity;
    double visibility;
    double pressure;
    int rising;

    factory Atmosphere.fromJson(Map<String, dynamic> json) => Atmosphere(
        humidity: json["humidity"],
        visibility: json["visibility"],
        pressure: json["pressure"].toDouble(),
        rising: json["rising"],
    );

    Map<String, dynamic> toJson() => {
        "humidity": humidity,
        "visibility": visibility,
        "pressure": pressure,
        "rising": rising,
    };
}

class ConditionII {
    ConditionII({
        required this.code,
        required this.text,
        required this.temperature,
    });

    int code;
    String text;
    int temperature;

    factory ConditionII.fromJson(Map<String, dynamic> json) => ConditionII(
        code: json["code"],
        text: json["text"],
        temperature: json["temperature"],
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "text": text,
        "temperature": temperature,
    };
}

class Wind {
    Wind({
        required this.chill,
        required this.direction,
        required this.speed,
    });

    int chill;
    int direction;
    int speed;

    factory Wind.fromJson(Map<String, dynamic> json) => Wind(
        chill: json["chill"],
        direction: json["direction"],
        speed: json["speed"],
    );

    Map<String, dynamic> toJson() => {
        "chill": chill,
        "direction": direction,
        "speed": speed,
    };
}

class Forecast {
    Forecast({
        required this.day,
        required this.date,
        required this.low,
        required this.high,
        required this.text,
        required this.code,
    });

    String day;
    int date;
    int low;
    int high;
    String text;
    int code;

    factory Forecast.fromJson(Map<String, dynamic> json) => Forecast(
        day: json["day"],
        date: json["date"],
        low: json["low"],
        high: json["high"],
        text: json["text"],
        code: json["code"],
    );

    Map<String, dynamic> toJson() => {
        "day": day,
        "date": date,
        "low": low,
        "high": high,
        "text": text,
        "code": code,
    };
}

class Location {
    Location({
        required this.city,
        required this.region,
        required this.woeid,
        required this.country,
        required this.lat,
        required this.long,
        required this.timezoneId,
    });

    String city;
    String region;
    int woeid;
    String country;
    double lat;
    double long;
    String timezoneId;

    factory Location.fromJson(Map<String, dynamic> json) => Location(
        city: json["city"],
        region: json["region"],
        woeid: json["woeid"],
        country: json["country"],
        lat: json["lat"].toDouble(),
        long: json["long"].toDouble(),
        timezoneId: json["timezone_id"],
    );

    Map<String, dynamic> toJson() => {
        "city": city,
        "region": region,
        "woeid": woeid,
        "country": country,
        "lat": lat,
        "long": long,
        "timezone_id": timezoneId,
    };
}
