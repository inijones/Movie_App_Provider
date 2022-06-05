import 'package:flutter/material.dart';
import 'package:movie_app_provider/models/genre/genre.dart';

class GenreList extends StatefulWidget {
  final ThemeData themeData;
  final List<int> genre;
  final List<Genres> totalGenre;

  const GenreList({
    Key? key,
    required this.themeData,
    required this.genre,
    required this.totalGenre,
  }) : super(key: key);

  @override
  State<GenreList> createState() => _GenreListState();
}

class _GenreListState extends State<GenreList> {
  List<Genres>? _genres;

  @override
  void initState() {
    super.initState();
    _genres = [];
    Future.delayed(Duration.zero, () {
      widget.totalGenre.forEach((valueGenre) {
        widget.genre.forEach((genre) {
          if (valueGenre.id == genre) {
            _genres?.add(valueGenre);
            setState(() {});
          }
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: Center(
        child: _genres == null
            ? const CircularProgressIndicator()
            : ListView.builder(
                itemBuilder: (BuildContext context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: InkWell(
                      onTap: () {
                        // naviagate to GenreMovies
                      },
                      child: Chip(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 1,
                            style: BorderStyle.solid,
                            color: widget.themeData.colorScheme.secondary,
                          ),
                        ),
                        label: Text(
                          _genres![index].name!,
                          style: widget.themeData.textTheme.bodyText1,
                        ),
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
