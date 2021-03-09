
import 'package:flutter/material.dart';
import 'package:flutter_weather/brewery_cubit.dart';
import 'package:flutter_cubit/flutter_cubit.dart';

class CountryPage extends StatefulWidget {
  @override
  _CountryPageState createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trending Movies'),
      ),
      body: CubitBuilder<BreweryCubit, BreweryState>(
        builder: (context, state) {
          if (state is LoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ErrorState) {
            return Center(
              child: Icon(Icons.close),
            );
          } else if (state is LoadedState) {
            final countries = state.breweries;

            return ListView.builder(
              itemCount: countries.length,
              itemBuilder: (context, index) => Card(
                child: ListTile(
                  title: Text(countries[index].name),
                  leading: CircleAvatar(
                    //backgroundImage: NetworkImage(countries[index].flag),
                  ),
                ),
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
