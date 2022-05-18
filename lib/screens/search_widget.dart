import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movie_app_provider/models/genre/genre.dart';
import 'package:movie_app_provider/models/movie/movie.dart';
import 'package:movie_app_provider/widget/search_movies_widget.dart';

class MovieSearch extends SearchDelegate<Movie?> {
  final ThemeData? themeData;
  final List<Genres>? genre;

  MovieSearch(this.themeData, this.genre);

  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = themeData!.copyWith(
      hintColor: themeData!.colorScheme.secondary,
      primaryColor: themeData!.primaryColor,
      textTheme: TextTheme(headline6: themeData!.textTheme.bodyText1),
    );

    return theme;
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(
          Icons.clear,
          color: themeData!.colorScheme.secondary,
        ),
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(
        Icons.arrow_back,
        color: themeData!.colorScheme.secondary,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return SearchMovieWidget(
      genres: genre,
      themeData: themeData,
      query: query,
      onTap: (movie) {
        close(context, movie);
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container(
      color: themeData!.primaryColor,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 50,
              height: 50,
              child: Icon(
                Icons.search,
                size: 50,
                color: themeData!.colorScheme.secondary,
              ),
            )
          ],
        ),
      ),
    );
  }
}
