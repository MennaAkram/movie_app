import 'package:flutter/material.dart';
import 'package:movie_app/features/home/domain/entity/results_entity.dart';
import 'package:movie_app/features/home/presentation/view/home_screen.dart';
import 'package:movie_app/features/movie_details/presentation/view/movie_details.dart';
import 'package:movie_app/features/movie_details/domain/entity/movie_details_entity.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomeScreen());

      case '/movie_details':
        final args = settings.arguments as Map<String, dynamic>;
        final movie = args['movie'] as ResultsEntity;
        final movieDetails = args['movieDetails'] as MovieDetailsEntity?;
        final movieId = args['movieId'] as int;
        return MaterialPageRoute(builder: (_) => MovieDetailsScreen(movieId: movieId, movie: movie, movieDetails: movieDetails));
    }
  }
}