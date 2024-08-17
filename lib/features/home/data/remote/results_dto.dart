import 'package:movie_app/shared/bases/base_mapper.dart';
import 'package:movie_app/features/home/domain/entity/results_entity.dart';

class ResultsDto extends BaseMapper<ResultsDto> {
  bool? adult;
  String? backdropPath;
  List<int>? genreIds;
  int? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  String? releaseDate;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;

  ResultsDto(
      {this.adult,
        this.backdropPath,
        this.genreIds,
        this.id,
        this.originalLanguage,
        this.originalTitle,
        this.overview,
        this.popularity,
        this.posterPath,
        this.releaseDate,
        this.title,
        this.video,
        this.voteAverage,
        this.voteCount
      });

  @override
  ResultsDto fromJson(Map<String, dynamic> json) {
    return ResultsDto(
      adult: json['adult'],
      backdropPath: json['backdrop_path'],
      genreIds: json['genre_ids'] != null ? List<int>.from(json['genre_ids']) : null,
      id: json['id'],
      originalLanguage: json['original_language'],
      originalTitle: json['original_title'],
      overview: json['overview'],
      popularity: json['popularity'],
      posterPath: json['poster_path'],
      releaseDate: json['release_date'],
      title: json['title'],
      video: json['video'],
      voteAverage: json['vote_average'],
      voteCount: json['vote_count'],
    );
  }

  @override
  Map<String, dynamic> toJson(ResultsDto object) {
    return {
      'adult': object.adult,
      'backdrop_path': object.backdropPath,
      'genre_ids': object.genreIds,
      'id': object.id,
      'original_language': object.originalLanguage,
      'original_title': object.originalTitle,
      'overview': object.overview,
      'popularity': object.popularity,
      'poster_path': object.posterPath,
      'release_date': object.releaseDate,
      'title': object.title,
      'video': object.video,
      'vote_average': object.voteAverage,
      'vote_count': object.voteCount,
    };
  }

  List<ResultsDto> toDto(List<dynamic> data) {
    return data.map((e) => ResultsDto().fromJson(e)).toList();
  }

  List<ResultsEntity> toEntityList(List<dynamic> data) {
    return ResultsDto().toDto(data).map((dto) => dto.toEntity()).toList();
  }

 ResultsEntity toEntity() {
    return ResultsEntity(
      adult: adult,
      backdropPath: backdropPath,
      genreIds: genreIds,
      id: id,
      originalLanguage: originalLanguage,
      originalTitle: originalTitle,
      overview: overview,
      popularity: popularity,
      posterPath: posterPath,
      releaseDate: releaseDate,
      title: title,
      video: video,
      voteAverage: voteAverage,
      voteCount: voteCount,
    );
  }
}
