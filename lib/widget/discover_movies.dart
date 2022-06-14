import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_provider/api/endpoints.dart';
import 'package:movie_app_provider/constant/api_constants.dart';
import 'package:movie_app_provider/models/functions.dart';
import 'package:movie_app_provider/models/genre/genre.dart';
import 'package:movie_app_provider/models/movie/movie.dart';
import 'package:movie_app_provider/screens/movie_details.dart';

class DiscoverMovies extends StatefulWidget {
  final ThemeData themeData;
  final List<Genres> genres;
  const DiscoverMovies({
    Key? key,
    required this.themeData,
    required this.genres,
  }) : super(key: key);

  @override
  State<DiscoverMovies> createState() => _DiscoverMoviesState();
}

class _DiscoverMoviesState extends State<DiscoverMovies> {
  List<Movie>? movieList;

  @override
  void initState() {
    super.initState();
    fetchMovies(Endpoints.discoverMoviesUrl(1)).then((value) {
      print(value);
      setState(
        () => movieList = value,
      );
    });
    // callData();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Discover',
                style: widget.themeData.textTheme.headline5,
              ),
            )
          ],
        ),
        SizedBox(
          width: double.infinity,
          height: 420,
          child: movieList == null
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : CarouselSlider.builder(
                  itemCount: movieList!.length,
                  itemBuilder:
                      (BuildContext context, int index, pageViewIndex) {
                    return GestureDetector(
                      onTap: () {
                        // Navigate to MovieDetailPage
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MovieDetailPage(
                                movie: movieList![index],
                                themeData: widget.themeData,
                                genres: widget.genres,
                                heroId: '${movieList![index].id}discover'),
                          ),
                        );
                      },
                      child: Hero(
                        tag: '${movieList![index].id}discover',
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: FadeInImage(
                            image: NetworkImage(TMDB_BASE_IMAGE_URL +
                                'w400/' +
                                movieList![index].posterPath!),
                            fit: BoxFit.cover,
                            placeholder:
                                const AssetImage('assets/images/loading.gif'),
                          ),
                        ),
                      ),
                    );
                  },
                  options: CarouselOptions(
                    disableCenter: true,
                    viewportFraction: 0.8,
                    enlargeCenterPage: true,
                  ),
                ),
        ),
      ],
    );
  }
}
