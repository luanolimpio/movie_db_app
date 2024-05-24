import 'package:flutter/material.dart';
import 'package:micro_common/micro_common.dart';
import 'package:micro_core/micro_core.dart';
import 'package:micro_dependencies/micro_dependencies.dart';
import 'package:micro_design_system/micro_design_system.dart';

import '../../../core/enums/tv_show_type_enum.dart';
import '../../../core/routes/tv_show_routes.dart';
import '../bloc/list/tv_show_bloc.dart';
import '../bloc/list/tv_show_event.dart';
import '../bloc/list/tv_show_state.dart';

class TVShowCardsWidget extends StatefulWidget {
  const TVShowCardsWidget({super.key});

  @override
  State<TVShowCardsWidget> createState() => _TVShowCardsWidgetState();
}

class _TVShowCardsWidgetState extends State<TVShowCardsWidget>
    with AutomaticKeepAliveClientMixin {
  late final TVShowBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = GetIt.I<TVShowBloc>()
      ..add(
        const GetTVShowsEvent(
          type: TVShowTypeEnum.onTheAir,
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
    return BlocBuilder(
      bloc: _bloc,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (state is TVShowsLoading) ...[
              Padding(
                padding: _padding,
                child: const DSShimmer(
                  height: 20,
                  width: 120,
                ),
              ),
              const SizedBox(height: 10),
              const DSHorizontalPosterListShimmer(),
            ] else if (state is TVShowsSuccess) ...[
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
              const SizedBox(height: 10),
              DSHorizontalPosterCardList(
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
