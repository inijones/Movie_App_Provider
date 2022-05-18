import 'package:flutter/material.dart';
import 'package:movie_app_provider/constant/api_constants.dart';
import 'package:movie_app_provider/models/functions.dart';
import 'package:movie_app_provider/models/genre/genre.dart';
import 'package:movie_app_provider/models/movie/movie.dart';

class ParticularGenreMovies extends StatefulWidget {
  final ThemeData themeData;
  final String api;
  final List<Genres> genres;
  const ParticularGenreMovies({
    Key? key,
    required this.themeData,
    required this.api,
    required this.genres,
  }) : super(key: key);

  @override
  State<ParticularGenreMovies> createState() => _ParticularGenreMoviesState();
}

class _ParticularGenreMoviesState extends State<ParticularGenreMovies> {
  List<Movie>? movieList;

  @override
  void initState() {
    super.initState();
    fetchMovies(widget.api).then(
      (value) => {
        setState(() => movieList = value),
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.themeData.primaryColor.withOpacity(0.8),
      child: movieList == null
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      // Navigate to Movie Details
                    },
                    child: SizedBox(
                      height: 150,
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 40.0),
                            child: Container(
                              width: double.infinity,
                              height: 100,
                              decoration: BoxDecoration(
                                color: widget.themeData.primaryColor,
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border.all(
                                  width: 1,
                                  color: widget.themeData.colorScheme.secondary,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 118,
                                  top: 8.0,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      movieList![index].title!,
                                      style:
                                          widget.themeData.textTheme.bodyText2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Text(
                                            '${movieList![index].voteAverage!}',
                                            style: widget
                                                .themeData.textTheme.bodyText1,
                                          ),
                                          const Icon(Icons.star,
                                              color: Colors.green)
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 0,
                            left: 8,
                            child: Hero(
                              tag: '$movieList![index].id',
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: FadeInImage(
                                  image: NetworkImage(TMDB_BASE_IMAGE_URL +
                                      'w500/' +
                                      movieList![index].posterPath!),
                                  fit: BoxFit.cover,
                                  placeholder: const AssetImage(
                                      'assets/images/loading.gif'),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
