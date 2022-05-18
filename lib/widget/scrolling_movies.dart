import 'package:flutter/material.dart';
import 'package:movie_app_provider/constant/api_constants.dart';
import 'package:movie_app_provider/models/functions.dart';
import 'package:movie_app_provider/models/genre/genre.dart';
import 'package:movie_app_provider/models/movie/movie.dart';

class ScrollingMovies extends StatefulWidget {
  final ThemeData themeData;
  final String? api, title;
  final List<Genres> genre;
  const ScrollingMovies({
    Key? key,
    required this.themeData,
    this.api,
    this.title,
    required this.genre,
  }) : super(key: key);

  @override
  State<ScrollingMovies> createState() => _ScrollingMoviesState();
}

class _ScrollingMoviesState extends State<ScrollingMovies> {
  List<Movie>? moviesList;

  @override
  void initState() {
    super.initState();
    fetchMovies(widget.api!).then(
      (value) => {
        setState(
          () => moviesList = value,
        )
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            widget.title!,
            style: widget.themeData.textTheme.headline5,
          ),
        ),
        SizedBox(
          width: double.infinity,
          height: 350,
          child: moviesList == null
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: moviesList!.length,
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {},
                        child: Hero(
                          tag: '${moviesList![index].id}${widget.title}',
                          child: SizedBox(
                            width: 180,
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: FadeInImage(
                                    image: NetworkImage(
                                      TMDB_BASE_IMAGE_URL +
                                          'w500/' +
                                          moviesList![index].posterPath!,
                                    ),
                                    fit: BoxFit.cover,
                                    placeholder: const AssetImage(
                                        'assets/images/loading.gif'),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    moviesList![index].title!,
                                    style: widget.themeData.textTheme.bodySmall,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }
}
