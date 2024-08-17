import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:movie_app/features/movie_details/domain/entity/movie_details_entity.dart';
import 'package:movie_app/features/movie_details/domain/repositories/movie_details_repo.dart';
import 'package:movie_app/shared/networking/failures.dart';
import 'package:movie_app/features/home/domain/entity/results_entity.dart';
import 'package:flutter/material.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  final MovieDetailsRepo _movieDetailsRepo;
  late MovieDetailsEntity movieDetails;

  MovieDetailsCubit(this._movieDetailsRepo) : super(MovieDetailsInitial());

  Future<void> getMovieDetails(int movieId) async {
    emit(MovieDetailsLoading());
    Either<NetworkException, MovieDetailsEntity> result = await _movieDetailsRepo.getMovieDetails(movieId);
    result.fold(
          (exception) {
            debugPrint("Movie Details Error: ${exception.message}");
            emit(MovieDetailsError(exception.message));},
          (movieDetails) {
            this.movieDetails = movieDetails;
            _getRecommendations(movieId);
            emit(MovieDetailsLoaded(movieDetails));
          },
    );
  }

  Future<void> _getRecommendations(int movieId) async {
    emit(MovieDetailsLoading());
    Either<NetworkException, List<ResultsEntity>> result = await _movieDetailsRepo.getRecommendations(movieId);
    result.fold(
          (exception) {
            debugPrint("Movie Recommended Error: ${exception.message}");
            emit(MovieDetailsError(exception.message)); },
          (recommendations)
          {
            this.movieDetails = movieDetails.copyWith(recommendations: recommendations);
            emit(MovieDetailsLoaded(movieDetails));
            });
  }
}

abstract class MovieDetailsState {}

class MovieDetailsInitial extends MovieDetailsState {}

class MovieDetailsLoading extends MovieDetailsState {}

class MovieDetailsLoaded extends MovieDetailsState {
  final MovieDetailsEntity movieDetails;

  MovieDetailsLoaded(this.movieDetails);
}

class MovieDetailsError extends MovieDetailsState {
  final String message;

  MovieDetailsError(this.message);
}