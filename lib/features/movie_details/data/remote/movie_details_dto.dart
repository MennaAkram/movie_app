import 'belongs_to_collection_dto.dart';
import 'genres_dto.dart';
import 'production_companies_dto.dart';
import 'production_countries_dto.dart';
import 'spoken_languages_dto.dart';
import 'package:movie_app/features/movie_details/domain/entity/movie_details_entity.dart';
import 'package:movie_app/shared/bases/base_mapper.dart';

class MovieDetailsDto extends BaseMapper<MovieDetailsDto> {
  bool? adult;
  String? backdropPath;
  BelongsToCollectionDto? belongsToCollection;
  int? budget;
  List<GenresDto>? genres;
  String? homepage;
  int? id;
  String? imdbId;
  List<String>? originCountry;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  List<ProductionCompaniesDto>? productionCompanies;
  List<ProductionCountriesDto>? productionCountries;
  String? releaseDate;
  int? revenue;
  int? runtime;
  List<SpokenLanguagesDto>? spokenLanguages;
  String? status;
  String? tagline;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;

  MovieDetailsDto(
      {this.adult,
        this.backdropPath,
        this.belongsToCollection,
        this.budget,
        this.genres,
        this.homepage,
        this.id,
        this.imdbId,
        this.originCountry,
        this.originalLanguage,
        this.originalTitle,
        this.overview,
        this.popularity,
        this.posterPath,
        this.productionCompanies,
        this.productionCountries,
        this.releaseDate,
        this.revenue,
        this.runtime,
        this.spokenLanguages,
        this.status,
        this.tagline,
        this.title,
        this.video,
        this.voteAverage,
        this.voteCount});

  @override
  MovieDetailsDto fromJson(Map<String, dynamic> json) {
    return MovieDetailsDto(
      adult: json['adult'],
      backdropPath: json['backdrop_path'],
      belongsToCollection: json['belongs_to_collection'] != null ? BelongsToCollectionDto().fromJson(json['belongs_to_collection']) : null,
      budget: json['budget'],
      genres: json['genres'] != null ? (json['genres'] as List).map((e) => GenresDto().fromJson(e)).toList() : null,
      homepage: json['homepage'],
      id: json['id'],
      imdbId: json['imdb_id'],
      originCountry: json['origin_country'] != null ? List<String>.from(json['origin_country']) : null,
      originalLanguage: json['original_language'],
      originalTitle: json['original_title'],
      overview: json['overview'],
      popularity: json['popularity'],
      posterPath: json['poster_path'],
      productionCompanies: json['production_companies'] != null ? (json['production_companies'] as List).map((e) => ProductionCompaniesDto().fromJson(e)).toList() : null,
      productionCountries: json['production_countries'] != null ? (json['production_countries'] as List).map((e) => ProductionCountriesDto().fromJson(e)).toList() : null,
      releaseDate: json['release_date'],
      revenue: json['revenue'],
      runtime: json['runtime'],
      spokenLanguages: json['spoken_languages'] != null ? (json['spoken_languages'] as List).map((e) => SpokenLanguagesDto().fromJson(e)).toList() : null,
      status: json['status'],
      tagline: json['tagline'],
      title: json['title'],
      video: json['video'],
      voteAverage: json['vote_average'],
      voteCount: json['vote_count'],
    );
  }

  @override
  Map<String, dynamic> toJson(MovieDetailsDto object) {
    return {
      'adult': object.adult,
      'backdrop_path': object.backdropPath,
      'belongs_to_collection': object.belongsToCollection,
      'budget': object.budget,
      'genres': object.genres,
      'homepage': object.homepage,
      'id': object.id,
      'imdb_id': object.imdbId,
      'origin_country': object.originCountry,
      'original_language': object.originalLanguage,
      'original_title': object.originalTitle,
      'overview': object.overview,
      'popularity': object.popularity,
      'poster_path': object.posterPath,
      'production_companies': object.productionCompanies,
      'production_countries': object.productionCountries,
      'release_date': object.releaseDate,
      'revenue': object.revenue,
      'runtime': object.runtime,
      'spoken_languages': object.spokenLanguages,
      'status': object.status,
      'tagline': object.tagline,
      'title': object.title,
      'video': object.video,
      'vote_average': object.voteAverage,
      'vote_count': object.voteCount,
    };
  }

  MovieDetailsEntity toEntity() {
    return MovieDetailsEntity(
      genres: genres?.map((e) => e.toEntity()).toList() ?? [],
      id: id ?? 0,
      overview: overview ?? '',
      posterPath: posterPath ?? '',
      title: title ?? '',
    );
  }
}