import 'package:task/features/main_view/models/activity_model.dart';
import 'package:task/features/main_view/repository/repository.dart';

class MainViewController {
  final repo = MainViewRepository();

  Future<List<ActivityModel>> fetchActivities() {
    return repo.fetchActivities();
  }

  Future<void> addNewActivity({required ActivityModel activityModel}) {
    return repo.addNewActivity(activityModel: activityModel);
  }
}
