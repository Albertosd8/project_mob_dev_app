part of 'user_account_bloc.dart';

abstract class UserEditAccountEvent {}

class UpdateUserAccount extends UserEditAccountEvent {
  final Map<String, String> newUserData;

  UpdateUserAccount({required this.newUserData});
}

class LoadUserData extends UserEditAccountEvent{}
