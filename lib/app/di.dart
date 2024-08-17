import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/features/home/data/repositories/movie_repo_impl.dart';
import 'package:movie_app/features/home/domain/repositories/movie_repo.dart';
import 'package:movie_app/features/home/presentation/cubit/movie_cubit.dart';
import 'package:movie_app/shared/networking/app_dio.dart';
import 'package:movie_app/shared/networking/app_interceptor.dart';
import 'package:movie_app/features/movie_details/presentation/cubit/movie_details_cubit.dart';
import 'package:movie_app/features/movie_details/data/repositories/movie_details_repo_impl.dart';
import 'package:movie_app/features/movie_details/domain/repositories/movie_details_repo.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  const String movieServes = 'movieServes';

  // Check if Dio instance is already registered
  if (!getIt.isRegistered<Dio>(instanceName: movieServes)) {
    // Register Dio instance
    getIt.registerSingleton<Dio>(appDio(AppInterceptor()), instanceName: movieServes);
  }

  // REPOSITORIES
  if (!getIt.isRegistered<MovieRepo>()) {
    getIt.registerSingleton<MovieRepo>(MoviesRepoImpl(
      getIt<Dio>(instanceName: movieServes),
    ));
  }
  if (!getIt.isRegistered<MovieDetailsRepo>()) {
    getIt.registerSingleton<MovieDetailsRepo>(MovieDetailsRepoImpl(
      getIt<Dio>(instanceName: movieServes),
    ));
  }

  // CUBITS
  if (!getIt.isRegistered<MovieCubit>()) {
    getIt.registerFactory<MovieCubit>(() => MovieCubit(getIt<MovieRepo>(), getIt<MovieDetailsRepo>()));
  }

  if (!getIt.isRegistered<MovieDetailsCubit>()) {
    getIt.registerFactory<MovieDetailsCubit>(() => MovieDetailsCubit(getIt<MovieDetailsRepo>()));
  }
}