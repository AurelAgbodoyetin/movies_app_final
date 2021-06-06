import 'package:ep_movie_app/core/api.dart';
import 'package:ep_movie_app/models/movie.dart';
import 'package:ep_movie_app/screens/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class MovieCard extends StatelessWidget {
  final Movie cardMovie;

  const MovieCard({Key key, this.cardMovie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsScreen(detailsMovie: cardMovie),
          )),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: CachedNetworkImage(
                  height: 100.0,
                  imageUrl: cardMovie.posterPath == null
                      ? defaultImage
                      : imageBase + cardMovie.posterPath,
                  // placeholder: (context, url) => CircularProgressIndicator(),
                  // errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
              SizedBox(width: 15.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(cardMovie.title == null
                        ? "Missing movie title"
                        : "Title : ${cardMovie.originalTitle}"),
                    Text(cardMovie.releaseDate == null
                        ? "Missing movie release date"
                        : "Date : ${cardMovie.releaseDate}"),
                    Text(cardMovie.voteAverage == null
                        ? "Missing movie vote"
                        : "Vote : ${cardMovie.voteAverage}"),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
