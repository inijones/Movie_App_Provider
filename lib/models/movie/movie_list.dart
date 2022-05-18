import 'package:movie_app_provider/models/movie/movie.dart';

class MovieList {
  int? page;
  int? totalMovies;
  int? totalPages;
  List<Movie>? movies;

  MovieList({
    this.page,
    this.totalMovies,
    this.totalPages,
    this.movies,
  });

  factory MovieList.fromJson(Map<String, dynamic> json) =>
      _$MovieListFromJson(json);

  Map<String, dynamic> toJson() => _$MovieListToJson(this);

  static MovieList _$MovieListFromJson(Map<String, dynamic> json) => MovieList(
        page: json['page'] as int?,
        totalMovies: json['results'].length as int?,
        totalPages: json['total_pages'] as int?,
        movies: (json['results'] as List<dynamic>?)
            ?.map((e) => Movie.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> _$MovieListToJson(MovieList instance) =>
      <String, dynamic>{
        'page': instance.page,
        'totalMovies': instance.totalMovies,
        'totalPages': instance.totalPages,
        'movies': instance.movies,
      };
}
