import 'package:movie_app/shared/bases/base_mapper.dart';

class CrewDto extends BaseMapper<CrewDto> {
  bool? adult;
  int? gender;
  int? id;
  String? knownForDepartment;
  String? name;
  String? originalName;
  double? popularity;
  String? profilePath;
  String? creditId;
  String? department;
  String? job;

  CrewDto(
      {this.adult,
        this.gender,
        this.id,
        this.knownForDepartment,
        this.name,
        this.originalName,
        this.popularity,
        this.profilePath,
        this.creditId,
        this.department,
        this.job
      });

  @override
  CrewDto fromJson(Map<String, dynamic> json) {
    return CrewDto(
    adult: json['adult'],
    gender: json['gender'],
    id: json['id'],
    knownForDepartment: json['known_for_department'],
    name: json['name'],
    originalName: json['original_name'],
    popularity: json['popularity'],
    profilePath: json['profile_path'],
    creditId: json['credit_id'],
    department: json['department'],
    job: json['job'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'adult': adult,
      'gender': gender,
      'id': id,
      'known_for_department': knownForDepartment,
      'name': name,
      'original_name': originalName,
      'popularity': popularity,
      'profile_path': profilePath,
      'credit_id': creditId,
      'department': department,
      'job': job,
    };
    }

    CrewEntity toEntity() {
      return CrewEntity(
        adult: adult ?? false,
        gender: gender ?? 0,
        id: id ?? 0,
        knownForDepartment: knownForDepartment ?? '',
        name: name ?? '',
        originalName: originalName ?? '',
        popularity: popularity ?? 0.0,
        profilePath: profilePath ?? '',
        creditId: creditId ?? '',
        department: department ?? '',
        job: job ?? '',
      );
    }
}