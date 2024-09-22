import 'package:dio/dio.dart';
import 'package:movies_app/constants/constants.dart';
import 'package:movies_app/models/movies_model.dart';

class MoviesService {
  final dio = Dio();
  var trendingMovies = [];
  var allTrendingMovies = [];
  var topMovies = [];
  var allTopMovies = [];
  var upcomingMovies = [];
  var allUpcomingMovies = [];
  var searchResults = [];
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
          "https://api.themoviedb.org/3/trending/movie/week?api_key=$apiKey&page=$i");
      final json = response.data["results"];
      for (var movie in json) {
        MoviesModel moviesModel = MoviesModel.fromJson(movie);
        allTrendingMovies.add(moviesModel);
      }
    }
    return allTrendingMovies;
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

  Future<List> getAllTopRatedMovies() async {
    for (var i = 1; i <= 500; i++) {
      final response = await dio.get(
          " https://api.themoviedb.org/3/movie/top_rated?api_key=$apiKey&page=$i");
      final json = response.data["results"];
      for (var movie in json) {
        MoviesModel moviesModel = MoviesModel.fromJson(movie);
        allTopMovies.add(moviesModel);
      }
    }
    return allTopMovies;
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

  Future<List> getAllUpcomingMovies() async {
    for (var i = 1; i <= 500; i++) {
      final response = await dio.get(
          "https://api.themoviedb.org/3/movie/upcoming?api_key=$apiKey&page=2");
      final json = response.data["results"];
      for (var movie in json) {
        MoviesModel moviesModel = MoviesModel.fromJson(movie);
        allUpcomingMovies.add(moviesModel);
      }
    }
    return allUpcomingMovies;
  }

  Stream<List> stream(String movieName) async* {
    for (var i = 1; i <= 500; i++) {
      final response = await dio.get(
          "https://api.themoviedb.org/3/search/movie?query=$movieName&api_key=$apiKey&page=$i");
      final json = response.data["results"];
      for (var movie in json) {
        MoviesModel moviesModel = MoviesModel.fromJson(movie);
        searchResults.add(moviesModel);
      }
      yield searchResults;
    }
  }

  Future<List> searchAllMovies(String movieName) async {
    for (var i = 1; i <= 500; i++) {
      final response = await dio.get(
          "https://api.themoviedb.org/3/search/movie?query=$movieName&api_key=$apiKey&page=$i");
      final json = response.data["results"];
      for (var movie in json) {
        MoviesModel moviesModel = MoviesModel.fromJson(movie);
        searchResults.add(moviesModel);
        Future.delayed(
          const Duration(seconds: 2),
        );
      }
    }
    return searchResults;
  }
}
