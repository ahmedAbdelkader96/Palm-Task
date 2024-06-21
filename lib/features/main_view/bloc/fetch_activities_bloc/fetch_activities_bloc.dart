import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/features/main_view/controller/controller.dart';
import 'package:task/features/main_view/models/activity_model.dart';

part 'fetch_activities_event.dart';
part 'fetch_activities_state.dart';

class FetchActivitiesBloc
    extends Bloc<FetchActivitiesEvent, FetchActivitiesState> {
  final MainViewController controller;

  static FetchActivitiesBloc get(BuildContext context) {
    return BlocProvider.of(context);
  }

  FetchActivitiesBloc(this.controller) : super(FetchActivitiesInitial()) {
    on<FetchActivities>((event, emit) async {
      try {
        emit(LoadingToFetchActivitiesState());
        List<ActivityModel> activities = await controller.fetchActivities();

        emit(DoneToFetchActivitiesState(activities: activities));
      } catch (error) {
        emit(ErrorToFetchActivitiesState(message: error.toString()));
      }
    });
  }
}
