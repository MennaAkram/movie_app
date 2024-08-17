import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/features/movie_details/data/remote/movie_details_dto.dart';
import 'package:movie_app/features/movie_details/domain/entity/movie_details_entity.dart';
import 'package:movie_app/features/movie_details/domain/repositories/movie_details_repo.dart';
import 'package:movie_app/shared/bases/base_repo.dart';
import 'package:movie_app/shared/configs/endpoints.dart';
import 'package:movie_app/shared/networking/failures.dart';
import 'package:movie_app/features/home/domain/entity/results_entity.dart';
import 'package:movie_app/features/home/data/remote/movies_dto.dart';

class MovieDetailsRepoImpl extends BaseRepository implements MovieDetailsRepo {
  MovieDetailsRepoImpl(Dio dio) : super(dio);

  @override
  Future<Either<NetworkException, MovieDetailsEntity>> getMovieDetails(int movieId) async {
    return await tryToExecute(
          () => dio.get(EndPoints.movieDetails(movieId)),
          (data) {
        final movieDetailsDto = MovieDetailsDto().fromJson(data);
        return movieDetailsDto.toEntity();
      },
    );
  }

  @override
  Future<Either<NetworkException, List<ResultsEntity>>> getRecommendations(int movieId) async {
    return await tryToExecute(
          () => dio.get(EndPoints.movieRecommendations(movieId)),
          (data) {
        final moviesDto = MoviesDto().fromJson(data);
        return moviesDto.results?.map((e) => e.toEntity()).toList() ?? [];
      },
    );
  }
}