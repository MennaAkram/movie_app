import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/home/domain/entity/movie_entity.dart';
import 'package:movie_app/features/home/domain/entity/results_entity.dart';
import 'package:movie_app/features/home/domain/repositories/movie_repo.dart';
import 'package:movie_app/shared/bases/base_cubit.dart';
import 'package:movie_app/shared/networking/failures.dart';
import 'package:movie_app/shared/bases/base_state.dart';
import 'package:movie_app/features/movie_details/domain/entity/movie_details_entity.dart';
import 'package:intl/intl.dart';
import 'package:movie_app/features/movie_details/domain/repositories/movie_details_repo.dart';

class MovieCubit extends BaseCubit {
  final MovieRepo _movieRepo;
  final MovieDetailsRepo _movieDetailsRepo;

  MovieCubit(this._movieRepo, this._movieDetailsRepo) : super(const InitState());

  List<ResultsEntity> movies = [];
  String errMessage = '';

  getMovies() async {
    emit(const LoadingState());

    Either<NetworkException, List<ResultsEntity>> result = await _movieRepo.getMovies();
    result.fold((NetworkException exception) {
      handleException(exception);
    }, (List<ResultsEntity> value) {
      movies = value;
      if (value.isNotEmpty && value[0].id != null) {
        _movieDetailsRepo.getMovieDetails(value[0].id!);
      }
      emit(const DoneState());
    });
  }
}