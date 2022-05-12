import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app_provider/models/cast/cast.dart';

import '../crew/crew.dart';

part 'credits.g.dart';

@JsonSerializable()
class Credits {
  int? id;
  List<Cast> cast;
  List<Crew> crew;

  Credits(this.id, this.cast, this.crew);

  factory Credits.fromJson(Map<String, dynamic> json) =>
      _$CreditsFromJson(json);

  Map<String, dynamic> toJson() => _$CreditsToJson(this);
}
