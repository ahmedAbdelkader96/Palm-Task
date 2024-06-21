import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/features/main_view/controller/controller.dart';
import 'package:task/features/main_view/models/activity_model.dart';

part 'add_new_activity_event.dart';
part 'add_new_activity_state.dart';

class AddNewActivityBloc
    extends Bloc<AddNewActivityEvent, AddNewActivityState> {
  final MainViewController controller;

  static AddNewActivityBloc get(BuildContext context) {
    return BlocProvider.of(context);
  }

  AddNewActivityBloc(this.controller) : super(AddNewActivityInitial()) {
    on<AddNewActivity>((event, emit) async {
      try {
        emit(LoadingToAddNewActivityState());
        await controller.addNewActivity(activityModel: event.activityModel);

        emit(DoneToAddNewActivityState());
      } catch (error) {
        emit(ErrorToAddNewActivityState(message: error.toString()));
      }
    });
  }
}
