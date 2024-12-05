
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wheather/cubits/getweathercubits/getweathercubit.dart';
import 'package:wheather/cubits/getweathercubits/getweatherstates.dart';
import 'package:wheather/views/home.dart';

void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  WeatherApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          Getweathercubit(), 
      child: Builder(
          builder: (context) => BlocBuilder<Getweathercubit, WeatherState>(
                builder: (context, state) {
                  return MaterialApp(
                    theme: ThemeData(
                        primarySwatch: getColorTheme(BlocProvider.of<
                                Getweathercubit>(context)
                            .weatherModel
                            ?.weathercondition), 

                        useMaterial3: false),
                    debugShowCheckedModeBanner: false,
                    home: HomePage(),
                    //     );
                  );
                },
              )
          ),
    );
  }
}


MaterialColor getColorTheme(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }
  switch (condition.toLowerCase()) {
    case "sunny":
    case "clear":
      return Colors.amber;
    case "partly cloudy":
      return Colors.blueGrey;
    case "cloudy":
    case "overcast":
    case "mist":
    case "fog":
    case "freezing fog":
      return Colors.grey;
    case "patchy rain possible":
    case "light drizzle":
    case "freezing drizzle":
    case "heavy freezing drizzle":
    case "patchy light rain":
    case "light rain":
    case "moderate rain at times":
    case "moderate rain":
    case "heavy rain at times":
    case "heavy rain":
    case "light freezing rain":
    case "moderate or heavy freezing rain":
    case "light sleet":
    case "moderate or heavy sleet":
    case "light rain shower":
    case "moderate or heavy rain shower":
    case "torrential rain shower":
    case "light sleet showers":
    case "moderate or heavy sleet showers":
    case "patchy light rain with thunder":
    case "moderate or heavy rain with thunder":
      return Colors.blue;
    case "patchy snow possible":
    case "patchy sleet possible":
    case "patchy freezing drizzle possible":
    case "blowing snow":
    case "blizzard":
    case "patchy light snow":
    case "light snow":
    case "patchy moderate snow":
    case "moderate snow":
    case "patchy heavy snow":
    case "heavy snow":
    case "ice pellets":
    case "light snow showers":
    case "moderate or heavy snow showers":
    case "light showers of ice pellets":
    case "moderate or heavy showers of ice pellets":
    case "patchy light snow with thunder":
    case "moderate or heavy snow with thunder":
      return Colors.lightBlue;
    case "thundery outbreaks possible":
      return Colors.yellow;
    default:
      return Colors.blue;
  }
}

