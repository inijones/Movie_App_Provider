
import 'package:json_annotation/json_annotation.dart';

part 'cast.g.dart';

@JsonSerializable()
class Cast {
  int? castId;
  String? character;
  String? creditid;
  int? gender;
  int? id;
  String? name;
  int? order;
  String? profilePath;

  Cast({
    this.castId,
    this.character,
    this.creditid,
    this.gender,
    this.id,
    this.name,
    this.order,
    this.profilePath,
  });

  factory Cast.fromJson(Map<String, dynamic> json) => _$CastFromJson(json);

  Map<String, dynamic> toJson() => _$CastToJson(this);
}
