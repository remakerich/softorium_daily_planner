// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DailyTaskImpl _$$DailyTaskImplFromJson(Map<String, dynamic> json) =>
    _$DailyTaskImpl(
      id: json['id'] as String,
      date: DateTime.parse(json['date'] as String),
      createdAt: DateTime.parse(json['createdAt'] as String),
      isDone: json['isDone'] as bool? ?? false,
      title: json['title'] as String? ?? '',
    );

Map<String, dynamic> _$$DailyTaskImplToJson(_$DailyTaskImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date.toIso8601String(),
      'createdAt': instance.createdAt.toIso8601String(),
      'isDone': instance.isDone,
      'title': instance.title,
    };
