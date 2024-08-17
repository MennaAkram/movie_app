import 'package:movie_app/shared/bases/base_mapper.dart';

class SpokenLanguagesDto extends BaseMapper<SpokenLanguagesDto> {
  String? englishName;
  String? iso6391;
  String? name;

  SpokenLanguagesDto({this.englishName, this.iso6391, this.name});

  @override
  SpokenLanguagesDto fromJson(Map<String, dynamic> json) {
    return SpokenLanguagesDto(
      englishName: json['english_name'],
      iso6391: json['iso_639_1'],
      name: json['name'],
    );
  }

  @override
  Map<String, dynamic> toJson(SpokenLanguagesDto object) {
    return {
      'english_name': object.englishName,
      'iso_639_1': object.iso6391,
      'name': object.name,
    };
  }
}