// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movie _$MovieFromJson(Map<String, dynamic> json) => Movie(
      voteCount: json['voteCount'] as int?,
      id: json['id'] as int?,
      video: json['video'] as bool?,
      voteAverage: json['voteAverage'] as String?,
      title: json['title'] as String?,
      popularity: (json['popularity'] as num?)?.toDouble(),
      posterPath: json['posterPath'] as String?,
      originalLanguage: json['originalLanguage'] as String?,
      originalTile: json['originalTile'] as String?,
      genreIds:
          (json['genreIds'] as List<dynamic>?)?.map((e) => e as int).toList(),
      backdropPath: json['backdropPath'] as String?,
      adult: json['adult'] as bool?,
      overview: json['overview'] as String?,
      releaseDate: json['releaseDate'] as String?,
    );

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
      'voteCount': instance.voteCount,
      'id': instance.id,
      'video': instance.video,
      'voteAverage': instance.voteAverage,
      'title': instance.title,
      'popularity': instance.popularity,
      'posterPath': instance.posterPath,
      'originalLanguage': instance.originalLanguage,
      'originalTile': instance.originalTile,
      'genreIds': instance.genreIds,
      'backdropPath': instance.backdropPath,
      'adult': instance.adult,
      'overview': instance.overview,
      'releaseDate': instance.releaseDate,
    };
