import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/features/main_view/bloc/add_new_activity_bloc/add_new_activity_bloc.dart';
import 'package:task/features/main_view/models/activity_model.dart';
import 'package:task/global/methods_helpers_functions/constants.dart';
import 'package:task/global/methods_helpers_functions/media_query.dart';
import 'package:task/global/methods_helpers_functions/toast.dart';
import 'package:task/global/navigation_routes/routes.dart';
import 'package:task/global/widgets/general_raw_material_button.dart';
import 'package:task/global/widgets/general_text_field_with_floating_label.dart';
import 'package:task/global/widgets/long_description_field_with_floating_label.dart';
import 'package:task/global/widgets/return_button.dart';

class AddNewActivityScreen extends StatefulWidget {
  const AddNewActivityScreen({super.key});

  @override
  State<AddNewActivityScreen> createState() => _AddNewActivityScreenState();
}

class _AddNewActivityScreenState extends State<AddNewActivityScreen> {
  TextEditingController activityTypeController = TextEditingController();
  TextEditingController durationController = TextEditingController();
  TextEditingController optionalNotesController = TextEditingController();

  @override
  void dispose() {
    activityTypeController.dispose();
    durationController.dispose();
    optionalNotesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                ReturnButton(),
                Expanded(
                  child: Text("Add New Activity",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,fontWeight: FontWeight.w700,color: Colors.black
                  ),),
                ),
                SizedBox(
                  width: 45,
                ),
              ],
            ),
          ),
          SizedBox(
            height: MQuery.getheight(context, 20),
          ),
          Expanded(
              child: SingleChildScrollView(
            padding: EdgeInsets.only(
                left: MQuery.getWidth(context, 16),
                right: MQuery.getWidth(context, 16)),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                GeneralTextFormField(
                    controller: activityTypeController,
                    labelText: "Activity Type",
                    onChanged: (V) {},
                    validator: (V) {}),
                const SizedBox(
                  height: 15,
                ),
                GeneralTextFormField(
                    controller: durationController,
                    labelText: "Duration (in minutes)",
                    onChanged: (V) {},
                    validator: (V) {}),
                const SizedBox(
                  height: 15,
                ),
                LongDescriptionFieldTextFormField(
                    controller: optionalNotesController,
                    labelText: "Optional Notes",
                    onChanged: (v) {},
                    validator: (v) {},
                    maxLength: null),
                const SizedBox(
                  height: 30,
                ),
                BlocConsumer<AddNewActivityBloc, AddNewActivityState>(
                  listener: (context, state) async {
                    if (state is ErrorToAddNewActivityState) {
                      ToastClass.toast(
                          context: context, data: state.message, seconds: 3);
                    }

                    if (state is DoneToAddNewActivityState) {
                      ToastClass.toast(
                          context: context,
                          data: "Activity has added successfully",
                          seconds: 3);

                      Routes.activitiesScreen(context: context);
                    }
                  },
                  builder: (context, state) {
                    return GeneralRawMaterialButton(
                        onPressed: () {
                          if (activityTypeController.text.trim().isEmpty) {
                            ToastClass.toast(
                                context: context,
                                data: "Activity Type should be provided",
                                seconds: 3);
                          } else if (durationController.text.trim().isEmpty) {
                            ToastClass.toast(
                                context: context,
                                data: "Duration should be provided",
                                seconds: 3);
                          } else if (int.tryParse(
                                  durationController.text.trim()) ==
                              null) {
                            ToastClass.toast(
                                context: context,
                                data: "Duration has an error!",
                                seconds: 3);
                          } else {
                            final activity = ActivityModel(
                                createdAt: DateTime.now(),
                                activityType:
                                    activityTypeController.text.trim(),
                                duration:
                                    int.parse(durationController.text.trim()),
                                optionalNotes:
                                    optionalNotesController.text.trim());

                            context
                                .read<AddNewActivityBloc>()
                                .add(AddNewActivity(activityModel: activity));
                          }
                        },
                        height: 56,
                        width: MQuery.getWidth(context, 328),
                        backColor: Constants.appSecondaryColor,
                        borderSideWidth: 0,
                        borderSideColor: Colors.transparent,
                        radius: 8,
                        child: Center(
                          child: state is LoadingToAddNewActivityState
                              ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : const Text(
                                  "Add",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                ),
                        ));
                  },
                ),


                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
