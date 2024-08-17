import 'package:movie_app/shared/bases/base_mapper.dart';
import 'package:movie_app/features/movie_details/domain/entity/genre_entity.dart';

class GenresDto extends BaseMapper<GenresDto> {
  int? id;
  String? name;

  GenresDto({this.id, this.name});

  @override
  GenresDto fromJson(Map<String, dynamic> json) {
    return GenresDto(
      id: json['id'],
      name: json['name'],
    );
  }

  @override
  Map<String, dynamic> toJson(GenresDto object) {
    return {
      'id': object.id,
      'name': object.name,
    };
  }

  GenreEntity toEntity() {
    return GenreEntity(
      id: id ?? 0,
      name: name ?? '',
    );
  }
}