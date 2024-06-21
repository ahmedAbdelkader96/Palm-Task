import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/features/main_view/bloc/add_new_activity_bloc/add_new_activity_bloc.dart';
import 'package:task/features/main_view/bloc/fetch_activities_bloc/fetch_activities_bloc.dart';
import 'package:task/features/main_view/controller/controller.dart';

class BlocProviders {
  static final List<BlocProvider> providers = [
    BlocProvider<FetchActivitiesBloc>(
        create: (_) => FetchActivitiesBloc(MainViewController())),
    BlocProvider<AddNewActivityBloc>(
        create: (_) => AddNewActivityBloc(MainViewController())),
  ];
}
