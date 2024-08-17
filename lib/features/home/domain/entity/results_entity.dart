class ResultsEntity {
  final List<int> genreIds;
  final int id;
  final String overview;
  final String posterPath;
  final String title;

  ResultsEntity({
    required this.genreIds,
    required this.id,
    required this.overview,
    required this.posterPath,
    required this.title,
  });
}