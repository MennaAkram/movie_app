import 'results_dto.dart';
import 'package:movie_app/shared/bases/base_mapper.dart';
import 'package:movie_app/features/home/domain/entity/movie_entity.dart';

class MoviesDto extends BaseMapper<MoviesDto> {
  int? page;
  List<ResultsDto>? results;
  int? totalPages;
  int? totalResults;

  MoviesDto({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults
  });

  @override
  MoviesDto fromJson(Map<String, dynamic> json) {
    return MoviesDto(
      page: json['page'],
      results: json['results'] != null ? (json['results'] as List).map((i) => ResultsDto().fromJson(i)).toList() : null,
      totalPages: json['total_pages'],
      totalResults: json['total_results'],
    );
  }

  @override
  Map<String, dynamic> toJson(MoviesDto object) {
    return {
      'page': object.page,
      'results': object.results?.map((e) => e.toJson(e)).toList(),
      'total_pages': object.totalPages,
      'total_results': object.totalResults,
    };
  }

}