import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/shared/widgets/movie_card.dart';
import 'package:movie_app/features/home/presentation/cubit/movie_cubit.dart';
import 'package:movie_app/app/di.dart';
import 'package:movie_app/shared/bases/base_state.dart';
import 'package:movie_app/design_system/theme.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final MovieCubit _cubit = getIt.get<MovieCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie App', style: Theme.of(context).appTexts.titleLarge.copyWith(
            color: Theme.of(context).appColors.primary
        ),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<MovieCubit, BaseState>(
        bloc: _cubit..getMovies(),
        builder: (context, state) {
          if (state is LoadingState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is DoneState) {
            return _cubit.movies.isEmpty
                ? Center(child: Text('No movies available'))
                : GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 2 / 3,
                crossAxisSpacing: 1,
                mainAxisSpacing: 1,
              ),
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: _cubit.movies.length,
              itemBuilder: (ctx, index) {
                return MovieCard(
                  movie: _cubit.movies[index],
                );
              },
            );
          } else {
            return Center(child: Text('Failed to load movies'));
          }
        },
      ),
    );
  }
}