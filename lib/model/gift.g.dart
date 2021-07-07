// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gift.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Gift _$GiftFromJson(Map<String, dynamic> json) {
  return Gift(
    id: json['id'] as int,
    title: json['title'] as String,
    desc: json['desc'] as String,
    createdAt: json['createdAt'] as String,
  );
}

Map<String, dynamic> _$GiftToJson(Gift instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'desc': instance.desc,
      'createdAt': instance.createdAt,
    };
