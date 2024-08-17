import 'package:movie_app/shared/bases/base_mapper.dart';

class CastDto extends BaseMapper<CastDto> {
  bool? adult;
  int? gender;
  int? id;
  String? knownForDepartment;
  String? name;
  String? originalName;
  double? popularity;
  String? profilePath;
  int? castId;
  String? character;
  String? creditId;
  int? order;

  CastDto(
      {this.adult,
        this.gender,
        this.id,
        this.knownForDepartment,
        this.name,
        this.originalName,
        this.popularity,
        this.profilePath,
        this.castId,
        this.character,
        this.creditId,
        this.order});

  @override
  CastDto fromJson(Map<String, dynamic> json) {
    return CastDto(
        adult: json['adult'],
        gender: json['gender'],
        id: json['id'],
        knownForDepartment: json['known_for_department'],
        name: json['name'],
        originalName: json['original_name'],
        popularity: json['popularity'],
        profilePath: json['profile_path'],
        castId: json['cast_id'],
        character: json['character'],
        creditId: json['credit_id'],
        order: json['order']
    );
  }

  @override
  Map<String, dynamic> toJson(CastDto object) {
    return {
      'adult': object.adult,
      'gender': object.gender,
      'id': object.id,
      'known_for_department': object.knownForDepartment,
      'name': object.name,
      'original_name': object.originalName,
      'popularity': object.popularity,
      'profile_path': object.profilePath,
      'cast_id': object.castId,
      'character': object.character,
      'credit_id': object.creditId,
      'order': object.order
    };
  }

  CastEntity toEntity() {
    return CastEntity(
        adult: adult ?? false,
        gender: gender ?? 0,
        id: id ?? 0,
        knownForDepartment: knownForDepartment ?? '',
        name: name ?? '',
        originalName: originalName ?? '',
        popularity: popularity ?? 0.0,
        profilePath: profilePath ?? '',
        castId: castId ?? 0,
        character: character ?? '',
        creditId: creditId ?? '',
        order: order ?? 0
}