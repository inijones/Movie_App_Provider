// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'genre_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenreList _$GenreListFromJson(Map<String, dynamic> json) => GenreList(
      (json['genre'] as List<dynamic>?)
          ?.map((e) => Genres.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GenreListToJson(GenreList instance) => <String, dynamic>{
      'genre': instance.genre,
    };
