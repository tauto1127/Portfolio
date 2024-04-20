// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'learning_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LearningItem _$LearningItemFromJson(Map<String, dynamic> json) => LearningItem(
      imageUrl:
          (json['imageUrl'] as List<dynamic>).map((e) => e as String).toList(),
      tags: (json['tags'] as List<dynamic>)
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
      progress: $enumDecode(_$ProgressEnumMap, json['progress']),
      date: LeaningItemDate.fromJson(json['date'] as Map<String, dynamic>),
      title: json['title'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$LearningItemToJson(LearningItem instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
      'tags': instance.tags,
      'progress': _$ProgressEnumMap[instance.progress]!,
      'date': instance.date,
    };

const _$ProgressEnumMap = {
  Progress.notStarted: 'notStarted',
  Progress.inProgress: 'inProgress',
  Progress.completed: 'completed',
};
