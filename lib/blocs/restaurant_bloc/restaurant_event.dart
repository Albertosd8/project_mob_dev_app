part of 'restaurant_bloc.dart';

abstract class RestaurantEvent {}

class AddToDatabaseRestaurantData extends RestaurantEvent {
  final Map<String, String> newRestaurantData;

  AddToDatabaseRestaurantData({required this.newRestaurantData});
}

class RemoveFromDatabaseRestaurantData extends RestaurantEvent {
  final Map<String, String> RestaurantDataToRemove;

  RemoveFromDatabaseRestaurantData({required this.RestaurantDataToRemove});
}

class LoadRestaurantData extends RestaurantEvent {}