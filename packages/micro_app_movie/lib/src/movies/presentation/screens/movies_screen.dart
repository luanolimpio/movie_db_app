import 'package:flutter/material.dart';
import 'package:micro_common/micro_common.dart';
import 'package:micro_core/micro_core.dart';
import 'package:micro_dependencies/micro_dependencies.dart';
import 'package:micro_design_system/micro_design_system.dart';

import '../../../core/routes/movie_routes.dart';
import '../arguments/movies_arguments.dart';
import '../bloc/movie_bloc.dart';
import '../bloc/movie_event.dart';
import '../bloc/movie_state.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({
    required this.arguments,
    super.key,
  });

  final MoviesArguments arguments;

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  MoviesArguments get _arguments => widget.arguments;

  late final MovieBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of<MovieBloc>(context);
    _bloc.add(const GetMoviesNowPlayingEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Filmes ${_arguments.type.label}',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        leadingWidth: 40,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: BlocConsumer<MovieBloc, MovieState>(
          listener: (context, state) {
            if (state is MovieError) {
              navigatorKey.currentState!.pop();
              DSAlertOverlay.show(
                context: context,
                type: DSAlertTypeEnum.error,
                title: state.message,
              );
            }
          },
          builder: (context, state) {
            if (state is MovieLoading) {
              return const DSVerticalPosterListShimmer();
            }
            if (state is MovieSuccess) {
              return DSVerticalPosterCardList(
                posterCards: List.generate(
                  state.movies.length,
                  (index) {
                    final movie = state.movies[index];
                    return DSPosterCard(
                      path: APIInfo.requestPosterImage(
                        movie.posterPath,
                      ),
                      onTap: () {
                        navigatorKey.currentState!.pushNamed(
                          MovieRoutes.details,
                          arguments: movie.id,
                        );
                      },
                    );
                  },
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
