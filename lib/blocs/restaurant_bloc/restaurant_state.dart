part of 'restaurant_bloc.dart';

abstract class RestaurantState {}

class RestaurantInitial extends RestaurantState {}

class LoadingRestaurantData extends RestaurantState {}

class LoadedRestaurantData extends RestaurantState {
  final List<dynamic> restaurant_data;
  LoadedRestaurantData({required this.restaurant_data});
  List<Object> get props => [restaurant_data];
}

class ErrorLoadingRestaurantData extends RestaurantState {}

class NoRestaurantData extends RestaurantState {}

class SuccessfulAddedRestaurant extends RestaurantState {}

class DuplicateRestaurant extends RestaurantState {}

class UnSuccessfulAddedRestaurant extends RestaurantState {}

class SuccessfulRemovedRestaurantFromDB extends RestaurantState {}

class UnSuccessfulRemovedRestaurantFromDB extends RestaurantState {}