part of 'fetch_activities_bloc.dart';

abstract class FetchActivitiesState extends Equatable {
  const FetchActivitiesState();
}

// crud states for all users
class FetchActivitiesInitial extends FetchActivitiesState {
  @override
  List<Object> get props => [];
}

class LoadingToFetchActivitiesState extends FetchActivitiesState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class DoneToFetchActivitiesState extends FetchActivitiesState {
  final List<ActivityModel> activities;

  const DoneToFetchActivitiesState({required this.activities});

  @override
  List<Object> get props => [];
}

class ErrorToFetchActivitiesState extends FetchActivitiesState {
  final String message;

  const ErrorToFetchActivitiesState({required this.message});

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
