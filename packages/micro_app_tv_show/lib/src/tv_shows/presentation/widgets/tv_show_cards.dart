import 'package:flutter/material.dart';
import 'package:micro_common/micro_common.dart';
import 'package:micro_core/micro_core.dart';
import 'package:micro_dependencies/micro_dependencies.dart';
import 'package:micro_design_system/micro_design_system.dart';

import '../../../core/routes/tv_show_routes.dart';
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
              const DSShimmer(
                height: 20,
                width: 120,
              ),
              const SizedBox(height: 10),
              const DSPosterListShimmer(),
            ] else if (state is TVShowSuccess) ...[
              const Text(
                'Séries em exibição',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              DSPosterCardList(
                posterCards: List.generate(
                  state.tvShows.length,
                  (index) {
                    final tvShow = state.tvShows[index];
                    return DSPosterCard(
                      path: APIInfo.requestPosterImage(
                        tvShow.posterPath,
                      ),
                      onTap: () {
                        navigatorKey.currentState!.pushNamed(
                          TVShowRoutes.details,
                          arguments: tvShow.id,
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
