import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
part 'filter_event.dart';
part 'filter_state.dart';

class FilterSearchDataBloc extends Bloc<FilterSearchEvent, FilterSearchState> {
  FilterSearchDataBloc() : super(FilterSearchInitial()) {
    on<LoadFilteredSearchRestaurantResults>(_loadFilteredSearchRestaurantsResults);
  }

  Future<FutureOr<void>> _loadFilteredSearchRestaurantsResults(event, emit) async {  
      emit(LoadingFilteredSearchRestaurantsResults());
      try{
        CollectionReference restaurants_collection = await FirebaseFirestore.instance.collection('restaurants'); 
        QuerySnapshot list_v = await restaurants_collection.get();
        List<dynamic> result = list_v.docs.map((e) => e.data()).toList();
        List<dynamic> Searchresults = [];
        if(event.search_text == null || event.search_text == ''){
          emit(NoDataYet());
        }else{ //si tiene al menos un producto con un precio menor o igual al del filtro
          var number_for_amount = double.parse(event.search_text);
          for(int i = 0; i < result.length; i++){ 
            if(result[i]['restaurant_name'] != null)
            {
              for(int j = 0 ; j < result[i]['products'].length ; j++){
                if(number_for_amount != 0 && number_for_amount >= result[i]['products'][j]['price']){
                  if(Searchresults.contains(result[i]) != true){
                    Searchresults.add(result[i]);
                  }
                }
              }
            }
          }
          if(Searchresults.length == 0){
            emit(NoFilteredRestaurantSearchRestaurantsResults());
          }else{
            emit(LoadedFilteredSearchRestaurantsResults(restaurant__filterdata: Searchresults)); 
          }
        }
      }catch( error ) {
        emit(ErrorFilteredLoadingSearchRestaurantsResults());
      }
  }
}