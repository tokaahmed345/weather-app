import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wheather/cubits/getweathercubits/getweathercubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search City"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Center(
            child: TextField(
        
          onSubmitted: (value) async {
           

            var getweathercubit = BlocProvider.of<Getweathercubit>(
                context); //=GetWeathercubit() , BlocProvider.of<Getweathercubit>(
            getweathercubit.getweather(cityname: value);

            Navigator.pop((context)); 
          }, 
          decoration: const InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 32, horizontal: 16),
              label: Text("Search"),
              hintText: "Enter City Name",
              suffixIcon: Icon(Icons.search),
              border: OutlineInputBorder()),
        )),
      ), //
      //focused when user used it border only used default
      //enabeld border contro; border  before when user use thiss
    );
  }
}

