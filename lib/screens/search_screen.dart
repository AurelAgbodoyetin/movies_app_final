import 'package:dio/dio.dart';
import 'package:ep_movie_app/models/movie.dart';
import 'package:ep_movie_app/models/movies_result.dart';
import 'package:ep_movie_app/services/dio_helper.dart';
import 'package:ep_movie_app/utils/movie_card.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  DioHelper _helper = DioHelper();
  List<Movie> moviesList;
  int moviesCount;
  TextEditingController _controller = TextEditingController();
  bool isSearching = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> getData(String value) async {
    Response<Map<String, dynamic>> searchMoviesResponse =
        await _helper.searchMovie(value);
    Map<String, dynamic> searchMoviesDataMap = searchMoviesResponse.data;
    print(searchMoviesDataMap);
    MovieResult searchMovies = MovieResult.fromJson(searchMoviesDataMap);
    setState(() {
      moviesList = searchMovies.results;
      moviesCount = moviesList.length;
      isSearching = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  onSaved: (value) {
                    if (value.trim().length == 0) {
                      return "Error";
                    } else {
                      return null;
                    }
                  },
                  controller: _controller,
                  decoration: InputDecoration(
                    hintText: "Enter a movie title",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10.0),
              Container(
                height: 50.0,
                child: OutlinedButton.icon(
                  onPressed: () {
                    //_controller.
                    setState(() {
                      isSearching = true;
                    });

                    getData(_controller.text);
                  },
                  icon: Icon(Icons.search),
                  label: Text("Search"),
                ),
              )
            ],
          ),
          SizedBox(height: 15.0),
          Expanded(
            child: Column(
              children: [
                if (isSearching)
                  Expanded(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                if (!isSearching && moviesCount == null)
                  Expanded(
                    child: Center(
                      child: Text('Search something'),
                    ),
                  ),
                if (!isSearching && moviesCount != null)
                  Expanded(
                    child: ListView.separated(
                      itemBuilder: (context, index) => MovieCard(
                        cardMovie: moviesList[index],
                      ),
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 10.0),
                      itemCount: moviesCount,
                    ),
                  )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
