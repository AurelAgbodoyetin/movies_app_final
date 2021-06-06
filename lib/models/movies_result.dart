import 'package:ep_movie_app/models/movie.dart';

class MovieResult {
  int page;
  List<Movie> results;
  int totalPages;
  int totalResults;

  MovieResult({this.page, this.results, this.totalPages, this.totalResults});

  MovieResult.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      results = <Movie>[];
      json['results'].forEach((v) {
        results.add(new Movie.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }
}
