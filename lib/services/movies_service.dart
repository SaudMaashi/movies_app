import 'package:dio/dio.dart';
import 'package:movies_app/constants/constants.dart';
import 'package:movies_app/models/movies_model.dart';

class MoviesService {
  final dio = Dio();
  var trendingMovies = [];
  var topMovies = [];
  var upcomingMovies = [];
  Future<List> getTrendingMovies() async {
    final response = await dio.get(
        "https://api.themoviedb.org/3/trending/movie/week?api_key=$apiKey");
    final json = response.data["results"];
    for (var movie in json) {
      MoviesModel moviesModel = MoviesModel.fromJson(movie);
      trendingMovies.add(moviesModel);
    }
    return trendingMovies;
  }

  Future<List> getTopRatedMovies() async {
    final response = await dio
        .get("https://api.themoviedb.org/3/movie/top_rated?api_key=$apiKey");
    final json = response.data["results"];
    for (var movie in json) {
      MoviesModel moviesModel = MoviesModel.fromJson(movie);
      topMovies.add(moviesModel);
    }
    return topMovies;
  }

  Future<List> getUpcomingMovies() async {
    final response = await dio
        .get("https://api.themoviedb.org/3/movie/upcoming?api_key=$apiKey");
    final json = response.data["results"];
    for (var movie in json) {
      MoviesModel moviesModel = MoviesModel.fromJson(movie);
      upcomingMovies.add(moviesModel);
    }
    return upcomingMovies;
  }
}
