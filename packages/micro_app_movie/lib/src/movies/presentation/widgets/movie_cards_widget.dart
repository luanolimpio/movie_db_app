import 'package:flutter/material.dart';
import 'package:micro_common/micro_common.dart';
import 'package:micro_core/micro_core.dart';
import 'package:micro_dependencies/micro_dependencies.dart';
import 'package:micro_design_system/micro_design_system.dart';
import '../../../core/enums/movie_type_enum.dart';
import '../../../core/routes/movie_routes.dart';
import '../bloc/list/movie_bloc.dart';
import '../bloc/list/movie_event.dart';
import '../bloc/list/movie_state.dart';

class MovieCardsWidget extends StatefulWidget {
  const MovieCardsWidget({Key? key}) : super(key: key);

  @override
  State<MovieCardsWidget> createState() => _MovieCardsWidgetState();
}

class _MovieCardsWidgetState extends State<MovieCardsWidget>
    with AutomaticKeepAliveClientMixin {
  late final MovieBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = GetIt.I<MovieBloc>()
      ..add(
        const GetMoviesEvent(
          type: MovieTypeEnum.nowPlaying,
          useCache: true,
        ),
      );
  }

  @override
  bool get wantKeepAlive => true;

  EdgeInsets get _padding => const EdgeInsets.symmetric(
        horizontal: 10,
      );

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder<MovieBloc, MovieState>(
      bloc: _bloc,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (state is MoviesLoading) ...[
              Padding(
                padding: _padding,
                child: const DSShimmer(
                  height: 20,
                  width: 120,
                ),
              ),
              const SizedBox(height: 10),
              const DSHorizontalPosterListShimmer(),
            ] else if (state is MoviesSuccess) ...[
              Padding(
                padding: _padding,
                child: const Text(
                  'Filmes em exibição',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              DSHorizontalPosterCardList(
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
              ),
            ],
          ],
        );
      },
    );
  }
}
