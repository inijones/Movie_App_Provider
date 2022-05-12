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
    return '';
  }
}

// class Endpoint {
//   static String discoverMoviesUrl(int page) {
//     return 'https://api.themoviedb.org/3/movie/top_rated?api_key=ef46ee59a31c5e276b9d3da0b83b3df4&language=en-US&page=1';
//   }
// }
