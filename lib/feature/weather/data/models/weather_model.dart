import 'dart:convert';

class WeatherModel {
  //   final data = snapshot.data!;

  // final currentWeatherData = data['list'][0];

  // final currentTemp = currentWeatherData['main']['temp'];
  // final currentSky = currentWeatherData['weather'][0]['main'];
  // final currentPressure = currentWeatherData['main']['pressure'];
  // final currentWindSpeed = currentWeatherData['wind']['speed'];
  // final currentHumidity = currentWeatherData['main']['humidity'];
  final String currentSky;
  final double currentTemp;
  final double currentPressure;
  final double currentWindSpeed;
  final double currentHumidity;

  WeatherModel({
    required this.currentSky,
    required this.currentTemp,
    required this.currentPressure,
    required this.currentWindSpeed,
    required this.currentHumidity,
  });
  WeatherModel copyWith({
    String? currentSky,
    double? currentTemp,
    double? currentPressure,
    double? currentHumidity,
  }) {
    return WeatherModel(
      currentSky: currentSky ?? this.currentSky,
      currentTemp: currentTemp ?? this.currentTemp,
      currentPressure: currentPressure ?? this.currentPressure,
      currentWindSpeed: currentWindSpeed,
      currentHumidity: currentHumidity ?? this.currentHumidity,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'currentTemp': currentTemp,
      'currentSky': currentSky,
      'currentPressure': currentPressure,
      'currentWindSpeed': currentWindSpeed,
      'currentHumidity': currentHumidity,
    };
  }

  factory WeatherModel.fromMap(Map<String, dynamic> map) {
    final currentWeatherData = map['list'][0];

    return WeatherModel(
      currentSky: currentWeatherData['weather'][0]['main'],
      currentTemp: currentWeatherData['main']['temp'],
      currentPressure: currentWeatherData['main']['pressure'],
      currentWindSpeed: currentWeatherData['wind']['speed'],
      currentHumidity: currentWeatherData['main']['humidity'],
    );
  }

  String toJson() => json.encode(toMap());
  factory WeatherModel.fromJson(String source) =>
      WeatherModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  int get hashCode {
    return currentTemp.hashCode ^
        currentSky.hashCode ^
        currentWindSpeed.hashCode ^
        currentPressure.hashCode ^
        currentHumidity.hashCode;
  }

  @override
  bool operator ==(covariant WeatherModel other) {
    if (identical(this, other)) return true;
    return other.currentTemp == currentTemp &&
        other.currentSky == currentSky &&
        other.currentPressure == currentPressure &&
        other.currentWindSpeed == currentWindSpeed &&
        other.currentHumidity == currentHumidity;
  }
}
