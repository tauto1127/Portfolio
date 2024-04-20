import 'package:json_annotation/json_annotation.dart';
import 'package:portfolio/main.dart';

part 'learning_item_date_model.g.dart';

@JsonSerializable()
class LeaningItemDate {
  late final int year;
  late final int month;

  LeaningItemDate(this.year, this.month) {
    if (2000 > year || year > 2200) {
      throw Exception('Year must be between 2000 and 2100');
    }
    if (1 > month || month > 12) {
      throw Exception('Month must be between 1 and 12');
    }
  }

  factory LeaningItemDate.fromJson(Map<String, dynamic> json) => _$LeaningItemDateFromJson(json);
  Map<String, dynamic> toJson() => _$LeaningItemDateToJson(this);
}
