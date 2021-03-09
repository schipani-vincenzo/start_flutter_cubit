import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather/brewery_cubit.dart';
import 'package:flutter_weather/cubit/weather_cubit.dart';
import 'package:flutter_weather/data/weather_repository.dart';
import 'package:flutter_weather/pages/brewery_pages.dart';
import 'package:flutter_cubit/flutter_cubit.dart';
import 'package:flutter_weather/pages/weather_search_page.dart';
import 'package:flutter_weather/repository/brewery_repository.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: CubitProvider<BreweryCubit>(
        create: (context) => BreweryCubit(
          repository: BreweryRepository(
            Dio(),
          ),
        ),
        child: CountryPage(),
      ),
      /*home: BlocProvider(
        create: (context) => WeatherCubit(FakeWeatherRepository()),
        child: WeatherSearchPage(),
      ),*/
    );
  }
}
