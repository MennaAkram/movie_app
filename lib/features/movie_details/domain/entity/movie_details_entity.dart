import 'package:movie_app/features/movie_details/domain/entity/genre_entity.dart';
import 'package:movie_app/features/home/domain/entity/results_entity.dart';

class MovieDetailsEntity {
  final int id;
  final String title;
  final String overview;
  final String posterPath;
  final List<GenreEntity> genres;
  final List<ResultsEntity> recommendations;

  MovieDetailsEntity({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.genres,
    this.recommendations = const [],
  });

  MovieDetailsEntity copyWith({
    int? id,
    String? title,
    String? overview,
    String? posterPath,
    List<GenreEntity>? genres,
    List<ResultsEntity>? recommendations,
  }) {
    return MovieDetailsEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      overview: overview ?? this.overview,
      posterPath: posterPath ?? this.posterPath,
      genres: genres ?? this.genres,
      recommendations: recommendations ?? this.recommendations,
    );
  }
}