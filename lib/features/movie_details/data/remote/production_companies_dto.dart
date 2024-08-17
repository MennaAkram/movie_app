import 'package:movie_app/shared/bases/base_mapper.dart';

class ProductionCompaniesDto extends BaseMapper<ProductionCompaniesDto> {
  int? id;
  String? logoPath;
  String? name;
  String? originCountry;

  ProductionCompaniesDto({this.id, this.logoPath, this.name, this.originCountry});

 @override
  ProductionCompaniesDto fromJson(Map<String, dynamic> json) {
    return ProductionCompaniesDto(
      id: json['id'],
      logoPath: json['logo_path'],
      name: json['name'],
      originCountry: json['origin_country'],
    );
  }

  @override
  Map<String, dynamic> toJson(ProductionCompaniesDto object) {
    return {
      'id': object.id,
      'logo_path': object.logoPath,
      'name': object.name,
      'origin_country': object.originCountry,
    };
  }
}