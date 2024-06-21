part of 'add_new_activity_bloc.dart';

abstract class AddNewActivityEvent extends Equatable {
  const AddNewActivityEvent();
}

class AddNewActivity extends AddNewActivityEvent {

  final ActivityModel activityModel;

  const AddNewActivity({required this.activityModel});

  @override
  List<Object?> get props => [];
}











