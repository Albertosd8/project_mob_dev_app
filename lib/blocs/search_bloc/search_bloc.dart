import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
part 'search_event.dart';
part 'search_state.dart';

class SearchDataBloc extends Bloc<SearchEvent, SearchState> {
  SearchDataBloc() : super(SearchInitial()) {
    on<LoadSearchRestaurantResults>(_loadSearchRestaurantsResults);
  }

  Future<FutureOr<void>> _loadSearchRestaurantsResults(event, emit) async {  
      emit(LoadingSearchRestaurantsResults());
      try{
        CollectionReference restaurants_collection = await FirebaseFirestore.instance.collection('restaurants'); 
        QuerySnapshot list_v = await restaurants_collection.get();
        List<dynamic> result = list_v.docs.map((e) => e.data()).toList();
        List<dynamic> Searchresults = [];
        for(int i = 0;i < result.length; i++){
          if(event.search_text.length == 0){
            Searchresults = [];
          }else{
            if(result[i]['restaurant_name'].contains(event.search_text)){
            Searchresults.add(result[i]);
            }
          }
        }
        if(Searchresults.isEmpty){
          emit(NoRestaurantSearchRestaurantsResults());
        }else{
          emit(LoadedSearchRestaurantsResults(restaurant_data: Searchresults)); 
        }
      }catch( error ) {
        emit(ErrorLoadingSearchRestaurantsResults());
      }
  }
}