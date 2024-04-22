import 'package:flutter/material.dart';
import 'package:micro_common/micro_common.dart';
import 'package:micro_dependencies/micro_dependencies.dart';
import 'package:micro_design_system/micro_design_system.dart';

import '../bloc/tv_show_bloc.dart';
import '../bloc/tv_show_event.dart';
import '../bloc/tv_show_state.dart';

class TVShowCards extends StatefulWidget {
  const TVShowCards({super.key});

  @override
  State<TVShowCards> createState() => _TVShowCardsState();
}

class _TVShowCardsState extends State<TVShowCards>
    with AutomaticKeepAliveClientMixin {
  late final TVShowBloc _bloc;

  EdgeInsets get _padding => const EdgeInsets.only(
        left: 10,
        right: 10,
        bottom: 10,
      );

  @override
  void initState() {
    super.initState();
    _bloc = GetIt.I<TVShowBloc>()..add(const GetTVShowsOnTheAirEvent());
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder(
      bloc: _bloc,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (state is TVShowLoading) ...[
              Padding(
                padding: _padding,
                child: const DSShimmer(
                  height: 20,
                  width: 120,
                ),
              ),
              const DSPosterListShimmer(),
            ] else if (state is TVShowSuccess) ...[
              Padding(
                padding: _padding,
                child: const Text(
                  'Séries em exibição',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              DSPosterCardList(
                posterCards: List.generate(
                  state.tvShows.length,
                  (index) {
                    final movie = state.tvShows[index];
                    return DSPosterCard(
                      path: APIInfo.requestPosterImage(
                        movie.posterPath,
                      ),
                      onTap: () {
                        // navigatorKey.currentState!.pushNamed(
                        //   MovieRoutes.details,
                        //   arguments: movie.id,
                        // );
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
