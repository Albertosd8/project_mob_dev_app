part of 'search_bloc.dart';

abstract class SearchState {}

class SearchInitial extends SearchState {}

class LoadingSearchRestaurantsResults extends SearchState {}

class LoadedSearchRestaurantsResults extends SearchState {
  final List<dynamic> restaurant_data;
  LoadedSearchRestaurantsResults({required this.restaurant_data});
  List<Object> get props => [restaurant_data];
}

class ErrorLoadingSearchRestaurantsResults extends SearchState {}

class NoRestaurantSearchRestaurantsResults extends SearchState {}

class NoDataYet extends SearchState{}

class DuplicateRestaurant extends SearchState {}

