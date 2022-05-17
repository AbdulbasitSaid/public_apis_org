// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'public_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PublicApiModel _$PublicApiModelFromJson(Map<String, dynamic> json) =>
    PublicApiModel(
      count: json['count'] as int,
      entries: (json['entries'] as List<dynamic>)
          .map((e) => EntryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PublicApiModelToJson(PublicApiModel instance) =>
    <String, dynamic>{
      'count': instance.count,
      'entries': instance.entries.map((e) => e.toJson()).toList(),
    };
