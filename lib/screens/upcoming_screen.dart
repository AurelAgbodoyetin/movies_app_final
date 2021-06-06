import 'package:dio/dio.dart';
import 'package:ep_movie_app/models/movie.dart';
import 'package:ep_movie_app/models/movies_result.dart';
import 'package:ep_movie_app/services/dio_helper.dart';
import 'package:ep_movie_app/utils/movie_card.dart';
import 'package:flutter/material.dart';

class UpcomingScreen extends StatefulWidget {
  @override
  _UpcomingScreenState createState() => _UpcomingScreenState();
}

class _UpcomingScreenState extends State<UpcomingScreen> {
  DioHelper _helper = DioHelper();
  List<Movie> moviesList;
  int moviesCount;

  Future<void> getData() async {
    Response<Map<String, dynamic>> upcomingMoviesResponse =
        await _helper.getUpcomingMovies();
    Map<String, dynamic> upcomingMoviesDataMap = upcomingMoviesResponse.data;
    MovieResult upcomingMovies = MovieResult.fromJson(upcomingMoviesDataMap);
    setState(() {
      moviesList = upcomingMovies.results;
      moviesCount = moviesList.length;
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return moviesList == null
        ? Center(
            child: CircularProgressIndicator(),
          )
        : ListView.separated(
            itemBuilder: (context, index) => MovieCard(
                  cardMovie: moviesList[index],
                ),
            separatorBuilder: (context, index) => SizedBox(height: 10.0),
            itemCount: moviesCount);
  }
}
