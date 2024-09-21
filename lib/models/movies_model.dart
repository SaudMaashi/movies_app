class MoviesModel {
  String title;
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
  });

  factory MoviesModel.fromJson(Map<String, dynamic> json) {
    return MoviesModel(
      title: json["title"] ?? "Title is NOT Available",
      poster: json["poster_path"] ?? "Poster is NOT Available",
      releaseDate: json["release_date"] ?? "Release Date is NOT Available",
      overview: json["overview"] ?? "Overview is NOT Available",
      vote: json["vote_average"].toString(),
    );
  }
}
