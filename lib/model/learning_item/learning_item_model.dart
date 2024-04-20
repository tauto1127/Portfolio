// class LearningItem {
//   final String title;
//   final String description;
//   final Image imageWidget;
//   final List<Tag> tags;
//   final Progress progress;
//   final LeaningItemDate date;

//   LearningItem(
//       {required this.imageWidget,
//       required this.tags,
//       required this.progress,
//       required this.date,
//       required this.title,
//       required this.description});
// }
import 'package:json_annotation/json_annotation.dart';
import 'package:portfolio/view/learning_item.dart';
import 'package:portfolio/model/learning_item/learning_item_date_model.dart';
import 'package:portfolio/model/learning_item/tag_model.dart';

part 'learning_item_model.g.dart';

@JsonSerializable()
class LearningItem {
  final String title;
  final String description;
  final List<String> imageUrl;
  final List<Tag> tags;
  final Progress progress;
  final LeaningItemDate date;

  LearningItem(
      {required this.imageUrl,
      required this.tags,
      required this.progress,
      required this.date,
      required this.title,
      required this.description});

  factory LearningItem.fromJson(Map<String, dynamic> json) => _$LearningItemFromJson(json);
  Map<String, dynamic> toJson() => _$LearningItemToJson(this);
}
