import 'package:cloud_firestore/cloud_firestore.dart';

part 'activity_model.g.dart';

class ActivityModel {
  static DateTime fromJsonDate(Timestamp value) => value.toDate();

  static Timestamp toJsonDate(DateTime value) => Timestamp.fromDate(value);

  var createdAt;
  String activityType;
  int duration;
  String optionalNotes;

  ActivityModel({
    required this.createdAt,
    required this.activityType,
    required this.duration,
    required this.optionalNotes,
  });

  factory ActivityModel.fromJson(Map<String, dynamic> json) =>
      _$ActivityModelFromJson(json);

  Map<String, dynamic> toJson() => _$ActivityModelToJson(this);

  factory ActivityModel.fromFirestoreSnapshot(QueryDocumentSnapshot? snapshot) {
    var obj = ActivityModel.fromJson(snapshot?.data() as Map<String, dynamic>);
    return ActivityModel(
        createdAt: obj.createdAt,
        activityType: obj.activityType,
        duration: obj.duration,
        optionalNotes: obj.optionalNotes);
  }

  factory ActivityModel.fromDocumentSnapshot(
      DocumentSnapshot? documentSnapshot) {
    var obj = ActivityModel.fromJson(
        documentSnapshot?.data() as Map<String, dynamic>);
    // String id = snapshot?.reference.id ?? '';
    // obj.cardId = id;
    return obj;
  }
}
