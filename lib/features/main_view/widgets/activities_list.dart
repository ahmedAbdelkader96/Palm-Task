import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/features/main_view/bloc/fetch_activities_bloc/fetch_activities_bloc.dart';
import 'package:task/features/main_view/widgets/activities_list_item.dart';
import 'package:task/features/main_view/widgets/activities_shimmer_list.dart';
import 'package:task/global/methods_helpers_functions/toast.dart';

class ActivitiesList extends StatelessWidget {
  const ActivitiesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FetchActivitiesBloc, FetchActivitiesState>(
      listener: (context, state) async {
        if (state is ErrorToFetchActivitiesState) {
          ToastClass.toast(
              context: context, data: state.message, seconds: 3);
          print(state.message);
        }
      },
      builder: (context, state) {

        if (state is DoneToFetchActivitiesState && state.activities.isEmpty) {
          return const Center(child: Text("No Activities Yet!"),);
        }

        if (state is DoneToFetchActivitiesState && state.activities.isNotEmpty) {
          return ListView.separated(
              itemBuilder: (context, index) {
                return ActivitiesListItem(activityModel: state.activities[index],);
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 15,
                );
              },
              itemCount: state.activities.length);
        }
        return const ActivitiesShimmerList();
      },
    );
  }
}
