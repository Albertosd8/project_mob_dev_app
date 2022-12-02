import 'dart:async';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:collection/collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
part 'restaurant_event.dart';
part 'restaurant_state.dart';

class DataRestaurantBloc extends Bloc<RestaurantEvent, RestaurantState> {
  DataRestaurantBloc() : super(RestaurantInitial()) {
    on<LoadRestaurantData>(_loadRestaurantData);
    // on<AddToDatabaseRestaurantData>(_addToDatabaseRestaurant);
    // on<RemoveFromDatabaseRestaurantData>(_removeFromDatabaseRestaurant);
  }

  Future<FutureOr<void>> _loadRestaurantData(event, emit) async {  
      emit(LoadingRestaurantData());
      try{
        CollectionReference restaurants_collection = await FirebaseFirestore.instance.collection('restaurants'); 
        QuerySnapshot list_v = await restaurants_collection.get();
        List<dynamic> result = list_v.docs.map((e) => e.data()).toList();
        if(result.length == 0){
          emit(NoRestaurantData());
        }else{
          emit(LoadedRestaurantData(restaurant_data: result)); 
        }
      }catch( error ) {
        emit(ErrorLoadingRestaurantData());
      }
  }

  // FutureOr<void> _addToDatabaseRestaurant(event, emit) async{
  //   // String? uId = await FirebaseAuth.instance.currentUser?.email;
  //   String? uId = 'email@gmail.com';
  //   CollectionReference collection = await FirebaseFirestore.instance.collection('users');
  //   var document = await collection.doc('email@gmail.com').get(); 
  //   // print(document.get('records'));    
  //   if(await document.get('records') == null){ //.records == null
  //     try{
  //       collection.doc('email@gmail.com').update({
  //         "records": {
  //           'fuerza': event.newUserData['fuerza'],
  //           'velocidad': event.newUserData['velocidad'],
  //           'acX': event.newUserData['acX'],
  //           'acY': event.newUserData['acY'],
  //           'acZ': event.newUserData['acZ'],
  //         },
  //       });
  //       emit(SuccessfulAddedToDB());
  //     } catch (error){
  //       emit(UnSuccessfulAddedToDB());
  //     }
  //   }else{
  //     var records_from_user = document.get('records');
  //     records_from_user.add({
  //         'fuerza': event.newUserData['fuerza'],
  //         'velocidad': event.newUserData['velocidad'],
  //         'acX': event.newUserData['acX'],
  //         'acY': event.newUserData['acY'],
  //         'acZ': event.newUserData['acZ'],
  //       });
  //       collection.doc('email@gmail.com').update({
  //         "records": records_from_user,
  //       });
  //       emit(SuccessfulAddedToDB());
  //   }
  // }

  // FutureOr<void> _removeFromDatabaseRestaurant(event, emit) async {
  //   String? uId = await FirebaseAuth.instance.currentUser?.uid;
  //   CollectionReference favorites = FirebaseFirestore.instance.collection('favorites');
  //   var document = await favorites.doc('favorites').get();
  //   var list_songs = await document.get('favorites');
  //   final index = list_songs.indexWhere((element) =>
  //     element["song_name"] == event.songToRemove["song_name"] &&
  //     element["song_artist"] == event.songToRemove["song_artist"]);
  //   list_songs.removeAt(index);
  //   favorites.doc('favorites').set({
  //     "favorites": list_songs,
  //   });
  //   emit(SuccessfulRemovedFromDB());
  // }
}