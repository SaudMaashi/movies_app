import 'package:dio/dio.dart';
import 'package:movies_app/constants/api_key.dart';
import 'package:movies_app/models/movies_model.dart';

class MoviesService {
  final dio = Dio();
  var moviesList = [];
  Future<List> getTrendingMovies() async {
    final response = await dio.get(
        "https://api.themoviedb.org/3/trending/movie/week?api_key=$apiKey");
    final json = response.data["results"];
    for (var movie in json) {
      MoviesModel moviesModel = MoviesModel.fromJson(movie);
      moviesList.add(moviesModel);
    }
    return moviesList;
  }

  Future<List> getTopRatedMovies() async {
    final response = await dio
        .get("https://api.themoviedb.org/3/movie/top_rated?api_key=$apiKey");
    final json = response.data["results"];
    for (var movie in json) {
      MoviesModel moviesModel = MoviesModel.fromJson(movie);
      moviesList.add(moviesModel);
    }
    return moviesList;
  }

  Future<List> getUpcomingMovies() async {
    final response = await dio
        .get("https://api.themoviedb.org/3/movie/upcoming?api_key=$apiKey");
    final json = response.data["results"];
    for (var movie in json) {
      MoviesModel moviesModel = MoviesModel.fromJson(movie);
      moviesList.add(moviesModel);
    }
    return moviesList;
  }
}
