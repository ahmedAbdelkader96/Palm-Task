
part of 'activity_model.dart';

ActivityModel _$ActivityModelFromJson(Map<String, dynamic> json) =>
    ActivityModel(
      createdAt: ActivityModel.fromJsonDate(json['created_at'] as Timestamp),
      activityType: json['activity_type'] as String,
      duration: json['duration'] as int,
      optionalNotes: json['optional_notes'] as String,
    );

Map<String, dynamic> _$ActivityModelToJson(ActivityModel instance) =>
    <String, dynamic>{
      'created_at': ActivityModel.toJsonDate(instance.createdAt),
      'activity_type': instance.activityType,
      'duration': instance.duration,
      'optional_notes': instance.optionalNotes,
    };
