part of 'search_bloc.dart';

abstract class SearchEvent {}

class LoadSearchRestaurantResults extends SearchEvent {
  final String search_text;

  LoadSearchRestaurantResults({required this.search_text});
}