import 'package:cached_network_image/cached_network_image.dart';
import 'package:ep_movie_app/core/api.dart';
import 'package:ep_movie_app/models/movie.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final Movie detailsMovie;

  const DetailsScreen({Key key, @required this.detailsMovie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          detailsMovie.title == null ? "Missing title" : detailsMovie.title,
        ),
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            child: CachedNetworkImage(
              imageUrl: detailsMovie.backdropPath == null
                  ? defaultImage
                  : imageBase + detailsMovie.backdropPath,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            color: Colors.black.withOpacity(.4),
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            alignment: Alignment.center,
            width: double.infinity,
            height: double.infinity,
            child: Text(
              detailsMovie.overview == null
                  ? "No overview for this movie"
                  : detailsMovie.overview,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
