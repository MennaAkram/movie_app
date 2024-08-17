import 'package:movie_app/features/home/data/remote/movies_dto.dart';
import 'package:movie_app/shared/bases/base_repo.dart';
import 'package:movie_app/shared/configs/endpoints.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/features/home/domain/repositories/movie_repo.dart';
import 'package:movie_app/shared/networking/failures.dart';
import 'package:movie_app/features/home/data/remote/results_dto.dart';
import 'package:movie_app/features/home/domain/entity/results_entity.dart';
import 'package:dartz/dartz.dart';

class MoviesRepoImpl extends BaseRepository implements MovieRepo {
  MoviesRepoImpl(Dio dio) : super(dio);

  @override
  Future<Either<NetworkException, List<ResultsEntity>>> getMovies() async {
    return await tryToExecute(
          () => dio.get(EndPoints.movies),
          (data) {
        final moviesDto = MoviesDto().fromJson(data);
        return moviesDto.results?.map((e) => e.toEntity()).toList() ?? [];
      },
    );
  }
}