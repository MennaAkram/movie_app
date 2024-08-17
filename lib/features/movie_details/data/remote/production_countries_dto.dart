import 'package:movie_app/shared/bases/base_mapper.dart';

class ProductionCountriesDto extends BaseMapper<ProductionCountriesDto> {
  String? iso31661;
  String? name;

  ProductionCountriesDto({this.iso31661, this.name});

  @override
  ProductionCountriesDto fromJson(Map<String, dynamic> json) {
    return ProductionCountriesDto(
      iso31661: json['iso_3166_1'],
      name: json['name'],
    );
  }

  @override
  Map<String, dynamic> toJson(ProductionCountriesDto object) {
    return {
      'iso_3166_1': object.iso31661,
      'name': object.name,
    };
  }
}