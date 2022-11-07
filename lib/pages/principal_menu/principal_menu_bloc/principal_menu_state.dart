part of 'principal_menu_bloc.dart';

abstract class EstablishmentsState {}

class EstablishmentsInitial extends EstablishmentsState {}

class LoadingEstablishments extends EstablishmentsState {}

class LoadedEstablishments extends EstablishmentsState {
  final List<Map<String,String>> establishments;

  LoadedEstablishments({required this.establishments});
  List<Object> get props => [establishments];
}

class ErrorLoadingEstablishments extends EstablishmentsState {}

class NoEstablishments extends EstablishmentsState {}