import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_app_provider/api/endpoints.dart';
import 'package:movie_app_provider/models/credits/credits.dart';
import 'package:movie_app_provider/models/genre/genre.dart';
import 'package:movie_app_provider/models/genre/genre_list.dart';
import 'package:movie_app_provider/models/movie/movie.dart';
import 'package:movie_app_provider/models/movie/movie_list.dart';

Future<List<Movie>> fetchMovies(String api) async {
  MovieList movieList;
  var res = await http.get(Uri.parse(api));
  var decodeRes = jsonDecode(res.body);
  movieList = MovieList.fromJson(decodeRes);
  return movieList.movies ?? [];
}

Future<Credits> fetchCredits(String api) async {
  Credits credits;
  var res = await http.get(Uri.parse(api));
  var decodeRes = jsonDecode(res.body);
  credits = Credits.fromJson(decodeRes);
  return credits;
}

Future<GenreList> fetchGenres() async {
  GenreList genreList;
  var res = await http.get(Uri.parse(Endpoints.genreUrl()));
  var decodeRes = jsonDecode(res.body);
  genreList = GenreList.fromJson(decodeRes);
  return genreList;
}
