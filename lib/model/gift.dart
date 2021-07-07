import 'package:json_annotation/json_annotation.dart';

part 'gift.g.dart';

@JsonSerializable()
class Gift {
  final int id;
  final String title;
  final String desc;
  final String createdAt;

  Gift({
    required this.id,
    required this.title,
    required this.desc,
    required this.createdAt
  });

  factory Gift.fromJson(Map<String, dynamic> json) => _$GiftFromJson(json);

  Map<String, dynamic> toJson() => _$GiftToJson(this);

}