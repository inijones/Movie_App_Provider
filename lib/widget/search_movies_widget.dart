import 'package:flutter/material.dart';
import 'package:movie_app_provider/api/endpoints.dart';
import 'package:movie_app_provider/constant/api_constants.dart';
import 'package:movie_app_provider/models/functions.dart';
import 'package:movie_app_provider/models/genre/genre.dart';
import 'package:movie_app_provider/models/movie/movie.dart';

class SearchMovieWidget extends StatefulWidget {
  final ThemeData? themeData;
  final String? query;
  final List<Genres>? genres;
  final Function(Movie)? onTap;

  const SearchMovieWidget({
    Key? key,
    this.themeData,
    this.query,
    this.genres,
    this.onTap,
  }) : super(key: key);

  @override
  State<SearchMovieWidget> createState() => _SearchMovieWidgetState();
}

class _SearchMovieWidgetState extends State<SearchMovieWidget> {
  List<Movie>? moviesList;

  @override
  void initState() {
    super.initState();
    fetchMovies(Endpoints.movieSearchUrl(widget.query!, 1)).then(
      (value) {
        setState(() {
          moviesList = value;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: widget.themeData!.primaryColor,
        child: moviesList == null
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : moviesList!.isEmpty
                ? Center(
                    child: Text(
                      "Oops! couldn't find the movie",
                      style: widget.themeData!.textTheme.bodyText1,
                    ),
                  )
                : ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: moviesList!.length,
                    itemBuilder: (BuildContext context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {},
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 70,
                                    height: 80,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child:
                                          moviesList![index].posterPath == null
                                              ? Image.asset(
                                                  'assets/image/na.jpg',
                                                  fit: BoxFit.cover,
                                                )
                                              : FadeInImage(
                                                  placeholder: const AssetImage(
                                                      'assets/images/loading.gif'),
                                                  image: NetworkImage(
                                                      TMDB_BASE_IMAGE_URL +
                                                          'w500/' +
                                                          moviesList![index]
                                                              .posterPath!),
                                                  fit: BoxFit.cover,
                                                ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            moviesList![index].voteAverage!,
                                            style: widget
                                                .themeData!.textTheme.bodyText1,
                                          ),
                                          const Icon(
                                            Icons.star,
                                            color: Colors.green,
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                                child: Divider(color: widget.themeData!.colorScheme.secondary),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ));
  }
}
