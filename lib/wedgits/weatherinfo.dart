import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wheather/cubits/getweathercubits/getweathercubit.dart';
import 'package:wheather/main.dart';

class Weatherinfo extends StatelessWidget {
  Weatherinfo({super.key});

  @override
  Widget build(BuildContext context) {
    var weather = BlocProvider.of<Getweathercubit>(context).weatherModel;
    return Container(
      decoration: BoxDecoration(gradient: LinearGradient(colors: [//لازم استخدم ماتريال كولور عشان اعرف اخد الشيتس منها
       getColorTheme(weather!.weathercondition),
         getColorTheme(weather.weathercondition)[300]!,
                  getColorTheme(weather.weathercondition)[400]!,

         getColorTheme(weather.weathercondition)[50]!



      ],begin: Alignment.topRight,end: Alignment.bottomRight,)),
      child: Padding(
        
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              weather.cityname,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
            Text(
              // "updated at ${weather.date}"
              "updated at ${weather.date.hour}:${weather.date.minute}",
              style: const TextStyle(
                fontSize: 24,
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.network(
                    // 'assets/cloudy.png',
                    fit: BoxFit.cover,
                    height: 100,
                    width: 100,
                    "https:${weather.image}"),
                Text(
                  // '17',
                  "${weather.temp.round()}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      'Maxtemp: ${weather.maxtemp.round()}',
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'Mintemp: ${weather.mintemp.round()}',
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 32,
            ),
            Text(
              weather.weathercondition,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
