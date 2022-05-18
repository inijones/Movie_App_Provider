import 'package:flutter/material.dart';
import 'package:movie_app_provider/api/endpoints.dart';
import 'package:movie_app_provider/models/functions.dart';
import 'package:movie_app_provider/models/genre/genre.dart';
import 'package:movie_app_provider/models/movie/movie.dart';
import 'package:movie_app_provider/theme/theme_state.dart';
import 'package:movie_app_provider/widget/discover_movies.dart';
import 'package:movie_app_provider/widget/scrolling_movies.dart';
import 'package:movie_app_provider/widget/settings_page.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<Genres> _genres = [];

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<ThemeState>(context);

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: state.themeData.primaryColor,
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: state.themeData.colorScheme.secondary,
          ),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
        centerTitle: true,
        title: Text(
          "Movie App",
          style: state.themeData.textTheme.headline5,
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () async {
              // final Movie? result = await showSearch(context: state.themeData, delegate: Movie)
            },
            icon: Icon(Icons.search),
            color: state.themeData.colorScheme.secondary,
          ),
        ],
      ),
      // Drawer Wiget
      drawer: Drawer(
        child: SettingsPage(),
      ),
      body: Container(
        color: state.themeData.primaryColor,
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            DiscoverMovies(
              themeData: state.themeData,
              genres: _genres,
            ),
            const SizedBox(height: 20),
            ScrollingMovies(
              themeData: state.themeData,
              title: 'Top Rated',
              api: Endpoints.topRatedURL(1),
              genre: _genres,
            ),
            ScrollingMovies(
              themeData: state.themeData,
              genre: _genres,
              title: 'Now Playing',
              api: Endpoints.nowPlayingMovieUrl(1),
            ),
            ScrollingMovies(
              themeData: state.themeData,
              genre: _genres,
              title: 'Popular',
              api: Endpoints.popularMoviesUrl(1),
            )
          ],
        ),
      ),
    );
  }
}
