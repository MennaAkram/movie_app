import 'results_entity.dart';

class MovieEntity {
  final int? page;
  final List<ResultsEntity>? results;
  final int? totalPages;
  final int? totalResults;

  MovieEntity({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults
  });
}