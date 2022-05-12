// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crew.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Crew _$CrewFromJson(Map<String, dynamic> json) => Crew(
      creditid: json['creditid'] as String?,
      department: json['department'] as String?,
      gender: json['gender'] as int?,
      id: json['id'] as String?,
      job: json['job'] as String?,
      name: json['name'] as String?,
      profilePath: json['profilePath'] as String?,
    );

Map<String, dynamic> _$CrewToJson(Crew instance) => <String, dynamic>{
      'creditid': instance.creditid,
      'department': instance.department,
      'gender': instance.gender,
      'id': instance.id,
      'job': instance.job,
      'name': instance.name,
      'profilePath': instance.profilePath,
    };
