import 'package:movie_app/shared/bases/base_mapper.dart';
import 'package:movie_app/features/movie_details/data/remote/cast_dto.dart';
import 'package:movie_app/features/movie_details/data/remote/crew_dto.dart';

class CreditsDto extends BaseMapper<CreditsDto> {
  int? id;
  List<CastDto>? cast;
  List<CrewDto>? crew;

  CreditsDto({this.id, this.cast, this.crew});

  @override
  CreditsDto.fromJson(Map<String, dynamic> json) {
    return CreditsDto(
      id: json['id'],
      cast: json['cast'] != null ? (json['cast'] as List).map((i) => CastDto().fromJson(i)).toList() : null,
      crew: json['crew'] != null ? (json['crew'] as List).map((i) => CrewDto().fromJson(i)).toList() : null,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'cast': cast?.map((e) => e.toJson()).toList(),
      'crew': crew?.map((e) => e.toJson()).toList(),
    };

    CreditsEntity toEntity() {
      return CreditsEntity(
        id: id ?? 0,
        cast: cast?.map((e) => e.toEntity()).toList() ?? [],
        crew: crew?.map((e) => e.toEntity()).toList() ?? [],
      );
    }
}