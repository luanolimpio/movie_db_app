import 'package:flutter/material.dart';
import 'package:micro_common/micro_common.dart';
import 'package:micro_core/micro_core.dart';
import 'package:micro_dependencies/micro_dependencies.dart';
import 'package:micro_design_system/micro_design_system.dart';

import '../../../core/routes/tv_show_routes.dart';
import '../arguments/tv_shows_arguments.dart';
import '../bloc/list/tv_show_bloc.dart';
import '../bloc/list/tv_show_event.dart';
import '../bloc/list/tv_show_state.dart';

class TVShowsScreen extends StatefulWidget {
  const TVShowsScreen({
    required this.arguments,
    super.key,
  });

  final TVShowsArguments arguments;

  @override
  State<TVShowsScreen> createState() => _TVShowsScreenState();
}

class _TVShowsScreenState extends State<TVShowsScreen>
    implements IPaginationController {
  TVShowsArguments get _arguments => widget.arguments;

  late final PaginationScrollController _paginationController;
  late final TVShowBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of<TVShowBloc>(context)
      ..add(GetTVShowsEvent(type: _arguments.type));
    _paginationController = PaginationScrollController(delegate: this);
  }

  @override
  void dispose() {
    _paginationController.dispose();
    super.dispose();
  }

  @override
  void loadMore() {
    _bloc.add(GetTVShowsEvent(type: _arguments.type));
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
              if (state.currentPage == 1) navigatorKey.currentState!.pop();
              DSAlertOverlay.show(
                context: context,
                type: DSAlertTypeEnum.error,
                title: state.message,
              );
            }
          },
          builder: (context, state) {
            if (state is TVShowsLoading && state.currentPage == 1) {
              return const DSVerticalPosterListShimmer(
                crossAxisCount: 3,
                height: 200,
              );
            }
            if (state.tvShows.isNotEmpty) {
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
                itemCount: state.tvShows.length + 3,
                itemBuilder: (_, index) {
                  if (index < state.tvShows.length) {
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
