import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/features/main_view/bloc/fetch_activities_bloc/fetch_activities_bloc.dart';
import 'package:task/features/main_view/widgets/activities_list.dart';
import 'package:task/global/methods_helpers_functions/constants.dart';
import 'package:task/global/methods_helpers_functions/media_query.dart';
import 'package:task/global/navigation_routes/routes.dart';

class ActivitiesScreen extends StatefulWidget {
  const ActivitiesScreen({super.key});

  @override
  State<ActivitiesScreen> createState() => _ActivitiesScreenState();
}

class _ActivitiesScreenState extends State<ActivitiesScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<FetchActivitiesBloc>().add(FetchActivities());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: (){
        Routes.addNewActivityScreen(context: context);
      },backgroundColor: Constants.appSecondaryColor,
        child: const Icon(Icons.add,color: Colors.white,),),
      body: Column(
        children: [


          SizedBox(
            height: MQuery.getheight(context, 40),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: MQuery.getWidth(context, 4),
                right: MQuery.getWidth(context, 4)),
            child: const Row(
              children: [

                Expanded(
                  child: Text("Activities",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 18,fontWeight: FontWeight.w700,color: Colors.black
                    ),),
                ),


              ],
            ),
          ),
          SizedBox(
            height: MQuery.getheight(context, 20),
          ),


          Expanded(
              child: Padding(
                padding:  EdgeInsets.only(left: MQuery.getWidth(context, 16),
                right: MQuery.getWidth(context, 16)),
                child: const ActivitiesList(),
              ))
        ],
      ),
    );
  }
}
