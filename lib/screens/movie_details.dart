import 'package:flutter/material.dart';
import 'package:movie_app_provider/api/endpoints.dart';
import 'package:movie_app_provider/constant/api_constants.dart';
import 'package:movie_app_provider/models/cast/cast.dart';
import 'package:movie_app_provider/models/genre/genre.dart';
import 'package:movie_app_provider/models/genre/genre_list.dart';
import 'package:movie_app_provider/models/movie/movie.dart';
import 'package:movie_app_provider/widget/genre_list.dart';
import 'package:movie_app_provider/widget/scrolling_artists.dart';

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
              // Background Image
              Expanded(
                child: Stack(
                  children: [
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
              )
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
                          padding: const EdgeInsets.fromLTRB(16, 25, 16, 16),
                          child: Card(
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            color: widget.themeData.primaryColor,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 120.0),
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
                                          style: widget
                                              .themeData.textTheme.headline5,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: <Widget>[
                                              Text(
                                                widget.movie.voteAverage!
                                                    .toString(),
                                                style: widget.themeData
                                                    .textTheme.bodyText1,
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
                                ),
                                Expanded(
                                  child: SingleChildScrollView(
                                    physics: const BouncingScrollPhysics(),
                                    child: Column(
                                      children: [
                                        widget.genres.isNotEmpty
                                            ? Container()
                                            : GenreList(
                                                themeData: widget.themeData,
                                                genre:
                                                    widget.movie.genreIds ?? [],
                                                totalGenre: widget.genres,
                                              ),
                                        Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0),
                                              child: Text(
                                                "Overview",
                                                style: widget.themeData
                                                    .textTheme.bodyText1,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            widget.movie.overview!,
                                            style: widget
                                                .themeData.textTheme.caption,
                                          ),
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0, bottom: 4.0),
                                              child: Text(
                                                'Release date : ${widget.movie.releaseDate}',
                                                style: widget.themeData
                                                    .textTheme.bodyText1,
                                              ),
                                            ),
                                          ],
                                        ),
                                        ScrollingArtists(
                                          api: Endpoints.getCreditsUrl(
                                              widget.movie.id!),
                                          title: 'Cast',
                                          tapButtonText: 'See full cast & crew',
                                          themeData: widget.themeData,
                                          onTap: (Cast cast) {
                                            modalBottomSheetMenu(cast);
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
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
    );
  }

  void modalBottomSheetMenu(Cast cast) {
    showModalBottomSheet(
      context: context,
      builder: (builder) {
        return Container(
          color: Colors.transparent,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Container(
                  padding: const EdgeInsets.only(top: 54),
                  decoration: BoxDecoration(
                    color: widget.themeData.primaryColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16.0),
                      topRight: Radius.circular(16.0),
                    ),
                  ),
                  child: Center(
                    child: ListView(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: <Widget>[
                              Text(
                                '${cast.name}',
                                style: widget.themeData.textTheme.bodyText2,
                              ),
                              Text(
                                'as',
                                style: widget.themeData.textTheme.bodyText2,
                              ),
                              Text(
                                '${cast.character}',
                                style: widget.themeData.textTheme.bodyText2,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: Container(
                    decoration: BoxDecoration(
                        color: widget.themeData.primaryColor,
                        border: Border.all(
                            color: widget.themeData.colorScheme.secondary,
                            width: 3),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: (cast.profilePath == null
                                    ? AssetImage('assets/images/na.jpg')
                                    : NetworkImage(TMDB_BASE_IMAGE_URL +
                                        'w500/' +
                                        cast.profilePath!))
                                as ImageProvider<Object>),
                        shape: BoxShape.circle),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
