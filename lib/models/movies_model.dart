class MoviesModel {
  String title;
  String backropPath;
  String poster;
  String releaseDate;
  String overview;
  String vote;

  MoviesModel({
    required this.title,
    required this.poster,
    required this.releaseDate,
    required this.overview,
    required this.vote,
    required this.backropPath,
  });

  factory MoviesModel.fromJson(Map<String, dynamic> json) {
    return MoviesModel(
      title: json["title"] ?? "Title is NOT Available",
      backropPath: json["backdrop_path"] ?? "Poster is NOT Avaiable",
      poster: json["poster_path"] ?? "Poster is NOT Available",
      releaseDate: json["release_date"] ?? "Release Date is NOT Available",
      overview: json["overview"] ?? "Overview is NOT Available",
      vote: json["vote_average"].toString(),
    );
  }
}
