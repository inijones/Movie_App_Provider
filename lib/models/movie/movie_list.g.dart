// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieList _$MovieListFromJson(Map<String, dynamic> json) => MovieList(
      page: json['page'] as int?,
      totalMovies: json['totalMovies'] as int?,
      totalPages: json['totalPages'] as int?,
      movies: (json['movies'] as List<dynamic>?)
          ?.map((e) => Movie.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MovieListToJson(MovieList instance) => <String, dynamic>{
      'page': instance.page,
      'totalMovies': instance.totalMovies,
      'totalPages': instance.totalPages,
      'movies': instance.movies,
    };
