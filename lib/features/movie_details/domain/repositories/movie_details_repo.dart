import 'package:dartz/dartz.dart';
import 'package:movie_app/features/movie_details/domain/entity/movie_details_entity.dart';
import 'package:movie_app/features/home/domain/entity/results_entity.dart';
import 'package:movie_app/shared/networking/failures.dart';

abstract class MovieDetailsRepo {
  Future<Either<NetworkException, MovieDetailsEntity>> getMovieDetails(int movieId);
  Future<Either<NetworkException, List<ResultsEntity>>> getRecommendations(int movieId);
}