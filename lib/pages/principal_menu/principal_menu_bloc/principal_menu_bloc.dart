import 'dart:async';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import 'package:collection/collection.dart';

part 'principal_menu_event.dart';
part 'principal_menu_state.dart';

class EstablishmentsBloc extends Bloc<EstablishmentsEvent, EstablishmentsState>{
  static List<Map<String,String>> establishment_list = [
    {
      "image": 'https://guich.mx/img/tips/come_saludable1.jpg',
      "establishment_name":'Guich'
    },
    {
      "image": 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQVHQt7j4bURu_TdSRGy6nsFeUe2lH-Ghn4QA&usqp=CAU',
      "establishment_name":'Limon & chia'
    },
    {
      "image": 'https://www.cafelaflordecordoba.com/img/sucursales/sucursal-81-5d27a1fd4a27f-b8d70f07895ac6ff368bcc1e5dd8e337.jpg',
      "establishment_name":'La flor de cordoba'
    },
    ];
    EstablishmentsBloc() : super(EstablishmentsInitial()) {
      on<LoadEstablishments>(_loadEstablishments);
  }

  void _loadEstablishments(event, emit) { //implement for firebase
    print("Hey");
    emit(LoadingEstablishments());
    if(establishment_list.length == 0){
      establishment_list.add({
      "image": event.newEst['https://www.yourtrainingedge.com/wp-content/uploads/2019/05/background-calm-clouds-747964.jpg'],
      "establishment_name": event.newEst['Guich']
      });
      emit(NoEstablishments());
    }else{
      emit(LoadedEstablishments(establishments: establishment_list));
    }
  }


}