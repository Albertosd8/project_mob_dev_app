part of 'search_bloc.dart';

abstract class SearchState {}

class SearchInitial extends SearchState {}

class LoadingSearchRestaurantsResults extends SearchState {}

class LoadingFilteredSearchRestaurantsResults extends SearchState {} //For filtered search

class LoadedSearchRestaurantsResults extends SearchState {
  final List<dynamic> restaurant_data;
  LoadedSearchRestaurantsResults({required this.restaurant_data});
  List<Object> get props => [restaurant_data];
}

class LoadedFilteredSearchRestaurantsResults extends SearchState { //For filtered search
  final List<dynamic> restaurant__filterdata;
  LoadedFilteredSearchRestaurantsResults({required this.restaurant__filterdata});
  List<Object> get props => [restaurant__filterdata];
}

class ErrorLoadingSearchRestaurantsResults extends SearchState {} 

class ErrorFilteredLoadingSearchRestaurantsResults extends SearchState {} //For filtered search

class NoRestaurantSearchRestaurantsResults extends SearchState {}

class NoFilteredRestaurantSearchRestaurantsResults extends SearchState {}//For filtered search

class NoDataYet extends SearchState{}

