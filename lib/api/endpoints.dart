import 'package:movie_app_provider/constant/api_constants.dart';

class Endpoints {

  static String discoverMoviesUrl(int page) {
    return '$TMDB_API_BASE_URL'
        '/discover/movie?api_key='
        '$TMDB_API_KEY'
        '&language=en-US&sort_by=popularity'
        '.desc&include_adult=false&include_video=false&page'
        '=$page';
  }

  static String nowPlayingMovieUrl(int page) {
    return '$TMDB_API_BASE_URL'
        '/movie/now_playing?api_key='
        '$TMDB_API_KEY'
        '&language=en-US&page=$page';
  }

  static String getCreditsUrl(int id) {
    return '$TMDB_API_BASE_URL/movie/$id/credits?api_key=$TMDB_API_KEY&language=en-US';
  }

  static String topRatedURL(int page) {
    return '$TMDB_API_BASE_URL'
        '/movie/top_rated?api_key='
        '$TMDB_API_KEY'
        '&language=en-US&page=$page';
  }

  static String popularMoviesUrl(int page) {
    return '$TMDB_API_BASE_URL'
        '/movie/popular?api_key='
        '$TMDB_API_KEY'
        '&language=en-US&page=$page';
  }

  static String upcomingMoviesUrl(int page) {
    return '$TMDB_API_BASE_URL'
        '/movie/upcoming?api_key='
        '$TMDB_API_KEY'
        '&language=en-US&page=$page';
  }

  static String movieDetailsUrl(int movieId) {
    return '$TMDB_API_BASE_URL/movie/$movieId?api_key=$TMDB_API_KEY&append_to_response=credits,image';
  }

  static String genreUrl() {
    return '$TMDB_API_BASE_URL'
        '/genre/movie/list?api_key='
        '$TMDB_API_KEY'
        '&language=en-US';
  }

  static String getMoviesForGenre(int genreId, int page) {
    return '$TMDB_API_BASE_URL/discover/movie?api_key=$TMDB_API_KEY'
        '&language=en-US'
        '&sort_by=popularity.desc'
        '&include_adult=false'
        '&page=$page'
        '&with_genre=$genreId';
  }

  static String movieReviewUrl(int movieId, int page) {
    return '$TMDB_API_BASE_URL/movie/$movieId/reviews?api_key=$TMDB_API_KEY'
        '&language=en-US&page=$page';
  }

  static String movieSearchUrl(String query, int page) {
    return '$TMDB_API_BASE_URL/search/movie?&api_key=$TMDB_API_KEY'
        '&language=en-US'
        '&query=$query'
        '&page=$page'
        '&include_adult=false';
  }

  static String personSearchUrl(String query, int page) {
    return '$TMDB_API_BASE_URL//search/person?api_key=$TMDB_API_KEY'
        '&language=en-US'
        '&query=$query'
        '&page=$page'
        '&include_adult=false';
  }

  static getPerson(int personId) {
    return "$TMDB_API_BASE_URL/person/$personId?api_key=$TMDB_API_BASE_URL&language=en-US";
  }
}


