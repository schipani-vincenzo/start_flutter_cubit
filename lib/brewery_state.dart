part of 'brewery_cubit.dart';

abstract class BreweryState extends Equatable{}

class InitialState extends BreweryState {
  @override
  List<Object> get props => [];
}



class LoadingState extends BreweryState{
  @override
  List<Object> get props => [];
}
class LoadedState extends BreweryState {
  final List<Brewery> breweries;

  LoadedState(this.breweries);

  @override
  List<Object> get props => [breweries];
}

class ErrorState extends BreweryState {
  @override
  List<Object> get props => [];
}
