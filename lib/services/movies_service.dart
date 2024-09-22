import 'package:dio/dio.dart';
import 'package:movies_app/constants/constants.dart';
import 'package:movies_app/models/movies_model.dart';

class MoviesService {
  final dio = Dio();
  var trendingMovies = [];
  var allTrendingMovies = [];
  var allTopMovies = [];
  var allUpcomingMovies = [];
  var trendingSearchResults = [];
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

  Future<List> getAllTrendingMovies() async {
    for (var i = 1; i < 100; i++) {
      final response = await dio.get(
          "https://api.themoviedb.org/3/trending/top_rated/week?api_key=$apiKey");
      final json = response.data["results"];
      for (var movie in json) {
        MoviesModel moviesModel = MoviesModel.fromJson(movie);
        allTrendingMovies.add(moviesModel);
      }
    }
    return allTrendingMovies;
  }

  Stream<List> getAllTopRatedMovies() async* {
    for (var i = 1; i <= 2; i++) {
      final response = await dio.get(
          "https://api.themoviedb.org/3/movie/top_rated?api_key=$apiKey&page=$i");
      final json = response.data["results"];
      for (var movie in json) {
        MoviesModel moviesModel = MoviesModel.fromJson(movie);
        allTopMovies.add(moviesModel);
      }
      yield allTopMovies;
    }
  }

  Stream<List> getAllUpcomingMovies() async* {
    for (var i = 1; i <= 2; i++) {
      final response = await dio.get(
          "https://api.themoviedb.org/3/movie/upcoming?api_key=$apiKey&page=$i");
      final json = response.data["results"];
      for (var movie in json) {
        MoviesModel moviesModel = MoviesModel.fromJson(movie);
        allUpcomingMovies.add(moviesModel);
      }
      yield allUpcomingMovies;
    }
  }

  Stream<List> searchAllMovies(String movieName) async* {
    for (var i = 1; i <= 500; i++) {
      final response = await dio.get(
          "https://api.themoviedb.org/3/search/movie?query=$movieName&api_key=$apiKey&page=$i");
      final json = response.data["results"];
      for (var movie in json) {
        MoviesModel moviesModel = MoviesModel.fromJson(movie);
        trendingSearchResults.add(moviesModel);
      }
      yield trendingSearchResults;
    }
  }
}
