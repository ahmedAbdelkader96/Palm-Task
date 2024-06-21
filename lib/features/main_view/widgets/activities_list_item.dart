import 'package:flutter/material.dart';
import 'package:task/features/main_view/models/activity_model.dart';
import 'package:task/global/methods_helpers_functions/constants.dart';

class ActivitiesListItem extends StatelessWidget {
  const ActivitiesListItem({super.key, required this.activityModel});
  final ActivityModel activityModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 150,
      constraints: const BoxConstraints(
        minHeight: 80
      ),
      child: Card(
        elevation: 4,

          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [



                        Row(
                          children: [
                            Text('Activity Type :',
                              style: TextStyle(
                                  fontSize: 14,fontWeight: FontWeight.w500,
                                  color: Constants.appSecondaryColor
                              ),),
                          ],
                        ),
                        const SizedBox(height: 5,),

                        Row(
                          children: [
                            Text(activityModel.activityType,
                            style: const TextStyle(
                              fontSize: 14,fontWeight: FontWeight.w500,
                              color: Colors.black
                            ),),
                          ],
                        ),
                      ],
                    ),
                    Text('${activityModel.duration} Min',
                      style: const TextStyle(
                          fontSize: 14,fontWeight: FontWeight.w500,
                          color: Colors.black
                      ),),

                  ],
                ),

                const SizedBox(height: 15,),


                Row(
                  children: [
                    Text('Optional Notes :',
                      style: TextStyle(
                          fontSize: 14,fontWeight: FontWeight.w500,
                          color: Constants.appSecondaryColor
                      ),),
                  ],
                ),
                const SizedBox(height: 5,),
                Row(
                  children: [
                    Expanded(child: Text(activityModel.optionalNotes)),

                  ],
                )
              ],
            ),
          ),
      ),
    );
  }
}
