import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/movie_details/presentation/cubit/movie_details_cubit.dart';
import 'package:movie_app/features/movie_details/domain/entity/movie_details_entity.dart';
import 'package:movie_app/app/di.dart';
import 'package:movie_app/features/home/domain/entity/results_entity.dart';
import 'dart:ui';
import 'package:movie_app/design_system/theme.dart';
import 'package:movie_app/features/movie_details/presentation/widgets/back_icon_button.dart';
import 'package:movie_app/shared/widgets/movie_card.dart';

class MovieDetailsScreen extends StatelessWidget {
  final int movieId;

  const MovieDetailsScreen({
    Key? key,
    required this.movieId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<MovieDetailsCubit>()..getMovieDetails(movieId),
      child: Scaffold(
        body: BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
          builder: (context, state) {
            if (state is MovieDetailsLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is MovieDetailsLoaded) {
              final movieDetails = state.movieDetails;
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        movieDetails.posterPath.isNotEmpty
                            ? Image.network(
                                'https://image.tmdb.org/t/p/w500${movieDetails.posterPath}',
                                width: double.infinity,
                                height: 400,
                                fit: BoxFit.cover)
                            : Image.asset('assets/images/placeholder.png',
                                width: double.infinity,
                                height: 400,
                                fit: BoxFit.cover),
                        Positioned(
                          top: 16,
                          left: 16,
                          child: BackIconButton(),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: ClipRRect(
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                              child: Container(
                                padding: EdgeInsets.all(8),
                                color: Theme.of(context).appColors.onPrimary.withOpacity(0.01),
                                child: Text(movieDetails.title,
                                    style: Theme.of(context).appTexts.titleMedium.copyWith(
                                      color: Theme.of(context).appColors.onPrimary,
                                    )),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Wrap(
                            spacing: 12,
                            children: movieDetails.genres
                                .map((genre) => Chip(
                                      label: Text(
                                        genre.name,
                                        style: Theme.of(context).appTexts.bodySmall,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                    ))
                                .toList(),
                          ),
                          SizedBox(height: 8),
                          Text(movieDetails.overview,
                              style: Theme.of(context).appTexts.labelMedium),
                          SizedBox(height: 8),
                          if (state.movieDetails.recommendations.isNotEmpty)
                            Text('Recommended', style: Theme.of(context).appTexts.titleMedium),
                          SizedBox(height: 8),
                          Container(
                            width: double.infinity,
                            height: 200,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              physics: const ClampingScrollPhysics(),
                              padding: EdgeInsets.zero,
                              itemCount:
                                  state.movieDetails.recommendations.length,
                              itemBuilder: (ctx, index) {
                                return MovieCard(
                                  movie: state.movieDetails.recommendations[index],
                                  width: 120,
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return Center(child: Text('Failed to load movie details'));
            }
          },
        ),
      ),
    );
  }
}
