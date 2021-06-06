import 'package:dio/dio.dart';
import 'package:ep_movie_app/models/movie.dart';
import 'package:ep_movie_app/models/movies_result.dart';
import 'package:ep_movie_app/services/dio_helper.dart';
import 'package:ep_movie_app/utils/movie_card.dart';
import 'package:flutter/material.dart';

class TrendingScreen extends StatefulWidget {
  @override
  _TrendingScreenState createState() => _TrendingScreenState();
}

class _TrendingScreenState extends State<TrendingScreen> {
  DioHelper _helper = DioHelper();
  List<Movie> moviesList;
  int moviesCount;

  Future<void> getData() async {
    Response<Map<String, dynamic>> trendingMoviesResponse =
        await _helper.getTrendingMovies();
    Map<String, dynamic> trendingMoviesDataMap = trendingMoviesResponse.data;
    MovieResult trendingMovies = MovieResult.fromJson(trendingMoviesDataMap);
    setState(() {
      moviesList = trendingMovies.results;
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
