import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:movie_app_provider/api/endpoints.dart';
import 'package:movie_app_provider/models/credits/credits.dart';
import 'package:movie_app_provider/models/genre/genre_list.dart';
import 'package:movie_app_provider/models/movie/movie.dart';
import 'package:movie_app_provider/models/movie/movie_list.dart';

Future<List<Movie>?> fetchMovies(String api) async {
  MovieList _movieList;
  final res = await http.get(Uri.parse(api));
  final statusCode = res.statusCode;
  if (statusCode == 200) {
    final rawJsonString = res.body;
    final jsonMap = jsonDecode(rawJsonString);
    _movieList = MovieList.fromJson(jsonMap);
    return _movieList.movies ?? [];
  } else {
    throw HttpException('$statusCode');
  }
}

// Future<Credits> fetchCredits(String api) async {
//   Credits _credits;
//   var res = await http.get(Uri.parse(api));
//   final statusCode = res.statusCode;
//   print(statusCode);
//   if (statusCode == 200) {
//     final rawJsonString = res.body;
//     final jsonMap = jsonDecode(rawJsonString);
//     _credits = Credits.fromJson(jsonMap);
//     return _credits;
//   } else {
//     throw HttpException('$statusCode');
//   }
// }

// Future<GenreList> fetchGenres() async {
//   GenreList _genreList;
//   var res = await http.get(Uri.parse(Endpoints.genreUrl()));
//   final statusCode = res.statusCode;
//   print(statusCode);
//   if (statusCode == 200) {
//     final rawJsonString = res.body;
//     final jsonMap = jsonDecode(rawJsonString);
//     _genreList = GenreList.fromJson(jsonMap["genres"]);
//     return _genreList;
//   } else {
//     throw HttpException('$statusCode');
//   }
// }
