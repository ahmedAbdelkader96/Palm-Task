import 'package:flutter/cupertino.dart';
import 'package:task/features/main_view/screens/activities_screen.dart';
import 'package:task/features/main_view/screens/add_new_activity_screen.dart';

class Routes {


  static Future<dynamic> activitiesScreen(
      {required BuildContext context}) async {
    return Navigator.pushAndRemoveUntil(
        context,
        CupertinoPageRoute(builder: (context) => const ActivitiesScreen()),
        (Route<dynamic> route) => false);
  }

  static Future<dynamic> addNewActivityScreen(
      {required BuildContext context}) async {
    return Navigator.push(context,
        CupertinoPageRoute(builder: (context) => const AddNewActivityScreen()));
  }
}
