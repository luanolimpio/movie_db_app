import 'package:flutter/material.dart';
import 'package:micro_common/micro_common.dart';
import 'package:micro_core/micro_core.dart';
import 'package:micro_dependencies/micro_dependencies.dart';
import 'package:micro_design_system/micro_design_system.dart';

import '../../../core/routes/tv_show_routes.dart';
import '../arguments/tv_shows_arguments.dart';
import '../bloc/tv_show_bloc.dart';
import '../bloc/tv_show_event.dart';
import '../bloc/tv_show_state.dart';

class TVShowsScreen extends StatefulWidget {
  const TVShowsScreen({
    required this.arguments,
    super.key,
  });

  final TVShowsArguments arguments;

  @override
  State<TVShowsScreen> createState() => _TVShowsScreenState();
}

class _TVShowsScreenState extends State<TVShowsScreen> {
  TVShowsArguments get _arguments => widget.arguments;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<TVShowBloc>(context)
        .add(GetTVShowsEvent(type: _arguments.type));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Séries ${_arguments.type.label}',
        ),
        leadingWidth: 40,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: BlocConsumer<TVShowBloc, TVShowState>(
          listener: (context, state) {
            if (state is TVShowsError) {
              navigatorKey.currentState!.pop();
              DSAlertOverlay.show(
                context: context,
                type: DSAlertTypeEnum.error,
                title: state.message,
              );
            }
          },
          builder: (context, state) {
            if (state is TVShowsLoading) {
              return const DSVerticalPosterListShimmer(
                crossAxisCount: 3,
                height: 200,
              );
            }
            if (state is TVShowsSuccess) {
              if (state.tvShows.isNotEmpty) {
                return DSVerticalPosterCardList(
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
                );
              }
              return const DSEmptyState();
            }
            return Container();
          },
        ),
      ),
    );
  }
}
