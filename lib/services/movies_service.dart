import 'package:dio/dio.dart';
import 'package:movies_app/constants/api_key.dart';
import 'package:movies_app/models/movies_model.dart';

class MoviesService {
  final dio = Dio();
  Future<List<MoviesModel>> getTrendingMovies() async {
    final response = await dio.get(
        "https://api.themoviedb.org/3/trending/movie/week?api_key=$apiKey");
    final json = response.data["results"];
    return json.map((movieModel) => MoviesModel.fromJson(json)).toList();
  }

  Future<List<MoviesModel>> getTopRatedMovies() async {
    final response = await dio
        .get("https://api.themoviedb.org/3/movie/top_rated?api_key=$apiKey");
    final json = response.data["results"];
    return json.map((movieModel) => MoviesModel.fromJson(json)).toList();
  }

  Future<List<MoviesModel>> getUpcomingMovies() async {
    final response = await dio
        .get("https://api.themoviedb.org/3/movie/upcoming?api_key=$apiKey");
    final json = response.data["results"];
    return json.map((movieModel) => MoviesModel.fromJson(json)).toList();
  }
}
