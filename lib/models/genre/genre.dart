
import 'package:json_annotation/json_annotation.dart';

part 'genre.g.dart';

@JsonSerializable()
class Genres {

  @JsonKey(name: "id")
  final int? id;
  
  @JsonKey(name: "name")
  final String? name;

  Genres({this.id, this.name});

  factory Genres.fromJson(Map<String, dynamic> json) => _$GenresFromJson(json);

  Map<String, dynamic> toJson() => _$GenresToJson(this);
}
