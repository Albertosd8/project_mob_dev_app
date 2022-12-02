part of 'filter_bloc.dart';

abstract class FilterSearchState {}

class FilterSearchInitial extends FilterSearchState {}

class LoadingFilteredSearchRestaurantsResults extends FilterSearchState {} //For filtered search

class LoadedFilteredSearchRestaurantsResults extends FilterSearchState { //For filtered search
  final List<dynamic> restaurant__filterdata;
  LoadedFilteredSearchRestaurantsResults({required this.restaurant__filterdata});
  List<Object> get props => [restaurant__filterdata];
}

class ErrorFilteredLoadingSearchRestaurantsResults extends FilterSearchState {} //For filtered search

class NoFilteredRestaurantSearchRestaurantsResults extends FilterSearchState {}//For filtered search

class NoDataYet extends FilterSearchState{}

