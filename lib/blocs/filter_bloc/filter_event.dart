part of 'filter_bloc.dart';

abstract class FilterSearchEvent {}

class LoadFilteredSearchRestaurantResults extends FilterSearchEvent { //For filtered search
  final String search_text;

  LoadFilteredSearchRestaurantResults({required this.search_text});
}