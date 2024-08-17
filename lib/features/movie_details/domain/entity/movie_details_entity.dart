import 'package:movie_app/features/movie_details/domain/entity/genre_entity.dart';
import 'package:movie_app/features/home/domain/entity/results_entity.dart';

class MovieDetailsEntity {
  final int id;
  final bool adult;
  final String title;
  final String overview;
  final String releaseDate;
  final String posterPath;
  final double voteAverage;
  final int voteCount;
  final List<GenreEntity> genres;
  final List<ResultsEntity> recommendations;

  MovieDetailsEntity({
    required this.id,
    required this.adult,
    required this.title,
    required this.overview,
    required this.releaseDate,
    required this.posterPath,
    required this.voteAverage,
    required this.voteCount,
    required this.genres,
    this.recommendations = const [],
  });

  MovieDetailsEntity copyWith({
    int? id,
    bool? adult,
    String? title,
    String? overview,
    String? releaseDate,
    String? posterPath,
    double? voteAverage,
    int? voteCount,
    List<GenreEntity>? genres,
    List<ResultsEntity>? recommendations,
  }) {
    return MovieDetailsEntity(
      id: id ?? this.id,
      adult: adult ?? this.adult,
      title: title ?? this.title,
      overview: overview ?? this.overview,
      releaseDate: releaseDate ?? this.releaseDate,
      posterPath: posterPath ?? this.posterPath,
      voteAverage: voteAverage ?? this.voteAverage,
      voteCount: voteCount ?? this.voteCount,
      genres: genres ?? this.genres,
      recommendations: recommendations ?? this.recommendations,
    );
  }
}