import 'dart:async';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import 'package:collection/collection.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'user_account_event.dart';
part 'user_account_state.dart';


class UserAccountEditBloc extends Bloc<UserEditAccountEvent, UserAccountEditState> {  
  UserAccountEditBloc() : super(UserAccountEditInitial()) {
    on<LoadUserData>(_loadUserAccount);
    on<UpdateUserAccount>(_updateUserAccount);
  }

  FutureOr<void> _loadUserAccount(event, emit) async{
    emit(LoadingUserAccountEdit()); 
    String? uId = await FirebaseAuth.instance.currentUser?.uid;
    CollectionReference collection = await FirebaseFirestore.instance.collection("users");
    var document = await collection.doc('user_test').get(); 
    try{
      if(await document.data() == null){
          emit(NoUserData());
      }else{
        List <dynamic> result = [{'username': document['username'], 'profile_image': document['profile_image']}];
        emit(LoadedUserAccountEdit(userdata: result)); 
      }
    }catch(error){
      emit(ErrorLoadingUserData);
    }
  }  

  FutureOr<void> _updateUserAccount(event, emit) async{
      String? uId = await FirebaseAuth.instance.currentUser?.uid;
      CollectionReference collection = await FirebaseFirestore.instance.collection("users");
      // var document = await favorites.doc('uId').get(); // .doc(uId) para el login pero no implementado//old line
      var document = await collection.doc(event.newUserData['user_id']).get(); 
      if(await document.data() == null){
          emit(NoUserData());
      }else{
        var username = document.get('username');
        var img = document.get('profile_image');
        if((username != null) && (img != null)){
          try{
            collection.doc('user_test').update({
              "username": event.newUserData['username'],
              "profile_image": event.newUserData['profile_image']
            });
            emit(SuccessfulUpdatedUserAccount());
          }catch(error){
            emit(UnSuccessfulUpdatedUserAccount());
          }
        }else{
          emit(ErrorWithUserData);
        }
      }
    }
}