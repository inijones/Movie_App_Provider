import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app_provider/models/genre/genre.dart';

part 'genre_list.g.dart';

@JsonSerializable()
class GenreList {
  List<Genres>? genre;

  GenreList(this.genre);

  factory GenreList.fromJson(Map<String, dynamic> json) => _$GenreListFromJson(json);

  Map<String, dynamic> toJson() => _$GenreListToJson(this);
}
