part of 'add_new_activity_bloc.dart';

abstract class AddNewActivityState extends Equatable {
  const AddNewActivityState();
}

// crud states for all users
class AddNewActivityInitial extends AddNewActivityState {
  @override
  List<Object> get props => [];
}

class LoadingToAddNewActivityState extends AddNewActivityState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class DoneToAddNewActivityState extends AddNewActivityState {
  @override
  List<Object> get props => [];
}

class ErrorToAddNewActivityState extends AddNewActivityState {
  final String message;

  const ErrorToAddNewActivityState({required this.message});

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
