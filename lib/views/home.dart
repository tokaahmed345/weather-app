import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wheather/cubits/getweathercubits/getweathercubit.dart';
import 'package:wheather/cubits/getweathercubits/getweatherstates.dart';
import 'package:wheather/views/search.dart';
import 'package:wheather/wedgits/Noweather.dart';
import 'package:wheather/wedgits/weatherinfo.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Weather App'),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const SearchView();
                      },
                    ),
                  );
                },
                icon: const Icon(Icons.search))
          ],
        ),

        body: BlocBuilder<Getweathercubit, WeatherState>(
            builder: (context, state) {
          if (state is NoWeatherState) {
            return const Noweather();
          } else if (state is LoadedWeathrState) {
          return   Weatherinfo(
         
          );
         
          } else {
            return const  Center(child: Text("oops,there is an error",style: TextStyle(fontSize: 25,color: Colors.black),));//اضافه الكونيست هنا يدل على ان الحاجه دى مبيتعملش لبيانتها رى بيلد بتتبنى مره واحده
          }
        }));
  }
}