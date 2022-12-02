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
        if(event.search_text == null || event.search_text == ''){
          emit(NoDataYet());
        }else{
          for(int i = 0; i < result.length; i++){ 
            if(result[i]['restaurant_name'] != null)
            { //it doesn't consider establishments names with accents 
              if((result[i]['restaurant_name'].toLowerCase()).contains(event.search_text.toLowerCase())){
                Searchresults.add(result[i]);
              }
            }
          }
          if(Searchresults.length == 0){
            emit(NoRestaurantSearchRestaurantsResults());
          }else{
            emit(LoadedSearchRestaurantsResults(restaurant_data: Searchresults)); 
          }
        }
      }catch( error ) {
        emit(ErrorLoadingSearchRestaurantsResults());
      }
  }
}