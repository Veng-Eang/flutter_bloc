import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_flutter/feature/weather/bloc/weather_bloc.dart';
import 'package:learn_flutter/feature/weather/presentation/widget/additional_info_item.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  void initState() {
    super.initState();
    context.read<WeatherBloc>().add(WeatherFetchData());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Weather App',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<WeatherBloc, WeatherState>(builder: (context, state) {
        if (state is WeatherFailure) {
          return Center(
            child: Text(state.message),
          );
        }
        if (state is! WeatherSuccess) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        final data = state.weatherModel;

        final currentTemp = data.currentTemp;
        final currentSky = data.currentSky;
        final currentPressure = data.currentPressure;
        final currentWindSpeed = data.currentWindSpeed;
        final currentHumidity = data.currentHumidity;
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // main card
              SizedBox(
                width: double.infinity,
                child: Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.0),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 10,
                        sigmaY: 10,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Text(
                              '$currentTemp K',
                              style: const TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 16.0),
                            Icon(
                              currentSky == 'Clouds' || currentSky == 'Rain'
                                  ? Icons.cloud
                                  : Icons.sunny,
                              size: 64,
                            ),
                            const SizedBox(height: 16.0),
                            Text(
                              currentSky,
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Hourly Forecast',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // const SizedBox(height: 10),
              // SizedBox(
              // height: 120,
              // child: ListView.builder(
              //   itemCount: 5,
              //   scrollDirection: Axis.horizontal,
              //   itemBuilder: (context, index) {
              //     final hourlyForecast = data['list'][index + 1];
              //     final hourlySky =
              //         data['list'][index + 1]['weather'][0]['main'];
              //     final time = DateTime.parse(hourlyForecast['dt_txt']);
              //     final hourlyTemp =
              //         hourlyForecast['main']['temp'].toString();
              //     return HourlyForecastItem(
              //       time: DateFormat.j().format(time),
              //       icon: hourlySky == 'Clouds' || hourlySky == 'Rain'
              //           ? Icons.cloud
              //           : Icons.sunny,
              //       temperature: hourlyTemp,
              //     );
              //   },
              // ),
              // ),
              const SizedBox(height: 20.0),
              const Text(
                'Additional Information',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  AdditionalInfoItem(
                    icon: Icons.water_drop,
                    label: 'Humidity',
                    value: currentHumidity.toString(),
                  ),
                  AdditionalInfoItem(
                    icon: Icons.air,
                    label: 'Wind Speed',
                    value: currentWindSpeed.toString(),
                  ),
                  AdditionalInfoItem(
                    icon: Icons.beach_access,
                    label: 'Pressure',
                    value: currentPressure.toString(),
                  ),
                ],
              )
            ],
          ),
        );
      }),
    );
  }
}
