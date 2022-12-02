part of 'user_account_bloc.dart';

abstract class UserAccountEditState {}

class UserAccountEditInitial extends UserAccountEditState {}

class LoadingUserAccountEdit extends UserAccountEditState {}

class LoadedUserAccountEdit extends UserAccountEditState {
  final List<dynamic> userdata;

  LoadedUserAccountEdit({required this.userdata});
  List<Object> get props => [userdata];
}

class ErrorUpdatingUserAccount extends UserAccountEditState {}

class ErrorWithUserData extends UserAccountEditState {}

class NoUserData extends UserAccountEditState {}

class SuccessfulUpdatedUserAccount extends UserAccountEditState {}

class UnSuccessfulUpdatedUserAccount extends UserAccountEditState {}

class ErrorLoadingUserData extends UserAccountEditState{}