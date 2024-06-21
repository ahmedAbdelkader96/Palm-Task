import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:task/features/main_view/models/activity_model.dart';
import 'package:task/features/main_view/repository/irepository.dart';
import 'package:task/global/methods_helpers_functions/constants.dart';

class MainViewRepository implements IMainViewRepository {
  @override
  Future<List<ActivityModel>> fetchActivities() async {
    return (await FirebaseFirestore.instance
            .collection(Constants.fireStoreActivitiesCollectionPath)
            .orderBy(Constants.createdAtParam, descending: false)
            .get())
        .docs
        .map((item) => ActivityModel.fromJson(item.data()))
        .toList();
  }

  @override
  Future<void> addNewActivity({required ActivityModel activityModel}) async {
    await FirebaseFirestore.instance
        .collection(Constants.fireStoreActivitiesCollectionPath)
        .add(activityModel.toJson());
  }
}
