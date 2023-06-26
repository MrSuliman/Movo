import 'package:equatable/equatable.dart';

class MovieModel extends Equatable {
  const MovieModel({
    this.id,
    this.title,
    this.overview,
    this.releaseDate,
    this.posterPath,
    this.backdropPath,
    this.popularity,
    this.voteAvg,
    this.voteCount,
  });

  final String? id;
  final String? title;
  final String? overview;
  final String? releaseDate;
  final String? posterPath;
  final String? backdropPath;
  final String? popularity;
  final String? voteAvg;
  final String? voteCount;

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'].toString(),
      title: json['title'],
      overview: json['overview'],
      releaseDate: json['release_date'],
      posterPath: json['poster_path'] ?? '',
      backdropPath: json['backdrop_path'] ?? '',
      popularity: json['popularity'].toString(),
      voteAvg: json['vote_average'].toString(),
      voteCount: json['vote_count'].toString(),
    );
  }

  @override
  List<Object?> get props => [
        id,
        title,
        overview,
        releaseDate,
        posterPath,
        backdropPath,
        popularity,
        voteAvg,
        voteCount,
      ];
}
