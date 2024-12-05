import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wheather/cubits/getweathercubits/getweatherstates.dart';
import 'package:wheather/models/weathermodel.dart';
import 'package:wheather/services/weatherservices.dart';

class Getweathercubit extends Cubit<WeatherState> {
  Getweathercubit()
      : super(
            NoWeatherState()); 
    WeatherModel? weatherModel;
  getweather({required String cityname}) async {
    try {
       weatherModel = (await Weatherservices(Dio()).getcurrentweather(
              cityname:
                  cityname))!; 
      emit(
          LoadedWeathrState());
    } catch (e) {
      emit(
          FailureWeatherState()); 
    }
  }

 

}