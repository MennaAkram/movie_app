import 'package:flutter/material.dart';
import 'package:movie_app/features/home/domain/entity/results_entity.dart';
import 'package:movie_app/features/movie_details/presentation/view/movie_details.dart';

class MovieCard extends StatelessWidget {
  final ResultsEntity movie;
  final double? width;

  MovieCard({
    required this.movie,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => MovieDetailsScreen(movieId: movie.id!, movie: movie),
        ),
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        clipBehavior: Clip.antiAlias,
        child: movie.posterPath?.isNotEmpty == true
            ? FadeInImage.assetNetwork(
          width: width ?? double.infinity,
          height: double.infinity,
          placeholder: 'assets/images/loading.gif',
          image: 'https://image.tmdb.org/t/p/w500${movie.posterPath}',
          fit: BoxFit.cover,
        )
            : Image.asset('assets/images/placeholder.png'),
      ),
    );
  }
}