import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app_provider/models/genre/genre.dart';

part 'genre_list.g.dart';

@JsonSerializable()
class GenresList {
  List<Genres>? genre;

  GenresList(this.genre);

  factory GenresList.fromJson(Map<String, dynamic> json) =>
      _$GenreListFromJson(json);

  Map<String, dynamic> toJson() => _$GenreListToJson(this);
}
