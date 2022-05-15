import 'package:flutter/material.dart';
import 'package:movie_app_provider/constant/api_constants.dart';
import 'package:movie_app_provider/models/cast/cast.dart';
import 'package:movie_app_provider/models/credits/credits.dart';
import 'package:movie_app_provider/models/functions.dart';

class ScrollingArtists extends StatefulWidget {
  final ThemeData? themeData;
  final String? api, title, tapButtonTest;
  final Function(Cast) onTap;
  const ScrollingArtists({
    Key? key,
    this.themeData,
    this.api,
    this.title,
    this.tapButtonTest,
    required this.onTap,
  }) : super(key: key);

  @override
  State<ScrollingArtists> createState() => _ScrollingArtistsState();
}

class _ScrollingArtistsState extends State<ScrollingArtists> {
  Credits? credits;

  @override
  void initState() {
    super.initState();
    fetchCredits(widget.api!)
        .then((value) => {setState(() => credits = value)});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        credits == null
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      widget.title!,
                      style: widget.themeData!.textTheme.bodyText1,
                    )
                  ],
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.title!,
                      style: widget.themeData!.textTheme.bodyText1,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      widget.tapButtonTest!,
                      style: widget.themeData!.textTheme.caption,
                    ),
                  ),
                ],
              ),
        SizedBox(
          width: double.infinity,
          height: 120,
          child: credits == null
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: credits!.cast.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          widget.onTap(credits!.cast[index]);
                        },
                        child: SizedBox(
                          width: 80,
                          child: Column(
                            children: [
                              Expanded(
                                child: SizedBox(
                                  width: 70,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child:
                                        credits!.cast[index].profilePath == null
                                            ? Image.asset(
                                                "assets/image/na.jpg",
                                                fit: BoxFit.cover,
                                              )
                                            : FadeInImage(
                                                fit: BoxFit.cover,
                                                placeholder: const AssetImage(
                                                    "assets/images/loading.gif"),
                                                image: NetworkImage(
                                                  TMDB_BASE_IMAGE_URL +
                                                      'w500/' +
                                                      credits!.cast[index]
                                                          .profilePath!,
                                                ),
                                              ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  credits!.cast[index].name!,
                                  style: widget.themeData!.textTheme.caption,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
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
