import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app_provider/models/movie/movie.dart';

part 'movie_list.g.dart';

@JsonSerializable()
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
}
