import 'package:movie_app/shared/bases/base_mapper.dart';

class BelongsToCollectionDto extends BaseMapper<BelongsToCollectionDto> {
  int? id;
  String? name;
  String? posterPath;
  String? backdropPath;

  BelongsToCollectionDto({this.id, this.name, this.posterPath, this.backdropPath});

  @override
  BelongsToCollectionDto fromJson(Map<String, dynamic> json) {
    return BelongsToCollectionDto(
      id: json['id'],
      name: json['name'],
      posterPath: json['poster_path'],
      backdropPath: json['backdrop_path'],
    );
  }

  @override
  Map<String, dynamic> toJson(BelongsToCollectionDto object) {
    return {
      'id': object.id,
      'name': object.name,
      'poster_path': object.posterPath,
      'backdrop_path': object.backdropPath,
    };
  }

}