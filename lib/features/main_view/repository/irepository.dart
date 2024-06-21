



import 'package:task/features/main_view/models/activity_model.dart';

abstract class IMainViewRepository {

  Future<List<ActivityModel>> fetchActivities();
  Future<void> addNewActivity({required ActivityModel activityModel});

}
