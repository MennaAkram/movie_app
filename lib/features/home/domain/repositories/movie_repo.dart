import'package:dartz/dartz.dart';
import'package:movie_app/features/home/domain/entity/movie_entity.dart';
import'package:movie_app/shared/networking/failures.dart';
import'package:movie_app/features/home/domain/entity/results_entity.dart';

abstract class MovieRepo {
  Future<Either<NetworkException, List<ResultsEntity>>> getMovies();
}