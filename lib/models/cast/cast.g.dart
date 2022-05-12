// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cast.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cast _$CastFromJson(Map<String, dynamic> json) => Cast(
      castId: json['castId'] as int?,
      character: json['character'] as String?,
      creditid: json['creditid'] as String?,
      gender: json['gender'] as int?,
      id: json['id'] as int?,
      name: json['name'] as String?,
      order: json['order'] as int?,
      profilePath: json['profilePath'] as String?,
    );

Map<String, dynamic> _$CastToJson(Cast instance) => <String, dynamic>{
      'castId': instance.castId,
      'character': instance.character,
      'creditid': instance.creditid,
      'gender': instance.gender,
      'id': instance.id,
      'name': instance.name,
      'order': instance.order,
      'profilePath': instance.profilePath,
    };
