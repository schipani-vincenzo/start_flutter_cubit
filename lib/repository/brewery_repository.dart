import 'package:dio/dio.dart';
import 'package:flutter_weather/data/model/brewery.dart';


class BreweryRepository {
  BreweryRepository(this.client);

  final Dio client;

  Future<List<Brewery>> getBreweries() async {
    try {
      //final url = 'https://api.themoviedb.org/3/trending/movie/week?api_key=060e7c76aff06a20ca4a875981216f3f';
      final url = 'https://api.openbrewerydb.org/breweries';

      final response = await client.get(url);
      //print("${Country.fromJson(response.data)}");

      var list = response.data as List;
      List<Brewery> breweries = list.map((i) => Brewery.fromJson(i)).toList();

      /*final countries = List<Country>.of(
        response.data[''].map<Country>(
              (json) => Country(
            name: json['name'],
            region: json['region'],
            subregion: json['subregion'],

            capital: json['capital'],
            nativeName: json['nativeName'],
            flag: 'flag',
          ),
        ),
      );*/


      return breweries;
    } catch (e) {
      throw e;
    }
  }
}