import 'package:flutter/material.dart';
import 'package:movie_app_provider/constant/api_constants.dart';
import 'package:movie_app_provider/models/genre/genre.dart';
import 'package:movie_app_provider/models/movie/movie.dart';

class MovieDetailPage extends StatefulWidget {
  final Movie movie;
  final ThemeData themeData;
  final String heroId;
  final List<Genres> genres;

  const MovieDetailPage({
    Key? key,
    required this.movie,
    required this.themeData,
    required this.heroId,
    required this.genres,
  }) : super(key: key);

  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Stack(
                children: [
                  // Stacked Column serving as the backgroung Image
                  Column(
                    children: [
                      // Background Image
                      widget.movie.backdropPath == null
                          ? Image.asset(
                              'assets/images/na.png',
                              fit: BoxFit.cover,
                            )
                          : FadeInImage(
                              width: double.infinity,
                              height: double.infinity,
                              fit: BoxFit.cover,
                              placeholder:
                                  AssetImage('assets/images/loading.gif'),
                              image: NetworkImage(TMDB_BASE_IMAGE_URL +
                                  'original/' +
                                  widget.movie.backdropPath!),
                            ),

                      //
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          gradient: LinearGradient(
                            begin: FractionalOffset.bottomCenter,
                            end: FractionalOffset.topCenter,
                            colors: [
                              widget.themeData.colorScheme.secondary,
                              widget.themeData.colorScheme.secondary
                                  .withOpacity(0.3),
                              widget.themeData.colorScheme.secondary
                                  .withOpacity(0.2),
                              widget.themeData.colorScheme.secondary
                                  .withOpacity(0.1),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          color: widget.themeData.colorScheme.secondary,
                        ),
                      ),
                    ],
                  ),
                  // Body Column
                  Column(
                    children: [
                      AppBar(
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        leading: IconButton(
                          icon: Icon(
                            Icons.arrow_back,
                            color: widget.themeData.colorScheme.secondary,
                          ),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          color: Colors.transparent,
                          child: Stack(
                            children: [
                              SizedBox(
                                width: double.infinity,
                                height: double.infinity,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(16, 25, 16, 16),
                                  child: Card(
                                    elevation: 5,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    color: widget.themeData.primaryColor,
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 120.0),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  widget.movie.title!,
                                                  style: widget.themeData
                                                      .textTheme.headline5,
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Row(
                                                    children: <Widget>[
                                                      Text(
                                                        widget
                                                            .movie.voteAverage!
                                                            .toString(),
                                                        style: widget
                                                            .themeData
                                                            .textTheme
                                                            .bodyText1,
                                                      ),
                                                      const Icon(
                                                        Icons.star,
                                                        color: Colors.green,
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
