import 'package:cubit/cubit.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_weather/data/model/brewery.dart';
import 'package:flutter_weather/repository/brewery_repository.dart';

part 'brewery_state.dart';


class BreweryCubit extends Cubit<BreweryState> {
  BreweryCubit({this.repository}) : super(InitialState()) {
    _getBreweries();
  }

  final BreweryRepository repository;

  void _getBreweries() async {
    try {
      emit(LoadingState());
      final breweries = await repository.getBreweries();
      emit(LoadedState(breweries));
    } catch (e) {
      emit(ErrorState());
    }
  }
}