import 'package:flutter/material.dart';
import 'package:micro_common/micro_common.dart';
import 'package:micro_core/micro_core.dart';
import 'package:micro_dependencies/micro_dependencies.dart';
import 'package:micro_design_system/micro_design_system.dart';

import '../../../core/routes/movie_routes.dart';
import '../arguments/movies_arguments.dart';
import '../bloc/list/movie_bloc.dart';
import '../bloc/list/movie_event.dart';
import '../bloc/list/movie_state.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({
    required this.arguments,
    super.key,
  });

  final MoviesArguments arguments;

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen>
    implements IPaginationController {
  MoviesArguments get _arguments => widget.arguments;

  late final PaginationScrollController _paginationController;
  late final MovieBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of<MovieBloc>(context)
      ..add(GetMoviesEvent(type: _arguments.type));
    _paginationController = PaginationScrollController(delegate: this);
  }

  @override
  void dispose() {
    _paginationController.dispose();
    super.dispose();
  }

  @override
  void loadMore() {
    _bloc.add(GetMoviesEvent(type: _arguments.type));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Filmes ${_arguments.type.label}',
        ),
        leadingWidth: 40,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: BlocConsumer<MovieBloc, MovieState>(
          listener: (context, state) {
            if (state is MoviesError) {
              navigatorKey.currentState!.pop();
              DSAlertOverlay.show(
                context: context,
                type: DSAlertTypeEnum.error,
                title: state.message,
              );
            }
          },
          builder: (context, state) {
            if (state is MoviesLoading && state.currentPage == 1) {
              return const DSVerticalPosterListShimmer(
                crossAxisCount: 3,
                height: 200,
              );
            }
            if (state.movies.isNotEmpty) {
              return GridView.builder(
                controller: _paginationController,
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  mainAxisExtent: 200,
                ),
                itemCount: state.movies.length + 3,
                itemBuilder: (_, index) {
                  if (index < state.movies.length) {
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
                  } else {
                    return const DSShimmer();
                  }
                },
              );
            } else {
              return const DSEmptyState();
            }
          },
        ),
      ),
    );
  }
}
