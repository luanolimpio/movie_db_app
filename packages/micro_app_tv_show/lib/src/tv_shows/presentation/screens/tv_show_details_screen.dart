import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:micro_common/micro_common.dart';
import 'package:micro_core/micro_core.dart';
import 'package:micro_dependencies/micro_dependencies.dart';
import 'package:micro_design_system/micro_design_system.dart';

import '../../domain/entities/tv_show_details_entity.dart';
import '../bloc/tv_show_bloc.dart';
import '../bloc/tv_show_event.dart';
import '../bloc/tv_show_state.dart';
import '../widgets/tv_show_details_card_widget.dart';

class TVShowDetailsScreen extends StatelessWidget {
  const TVShowDetailsScreen({
    required this.tvShowId,
    super.key,
  });

  final int tvShowId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          GetIt.I<TVShowBloc>()..add(GetTVShowDetailsEvent(id: tvShowId)),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: BlocConsumer<TVShowBloc, TVShowState>(
              listener: (context, state) {
                if (state is TVShowDetailsError) {
                  navigatorKey.currentState!.pop();
                  DSAlertOverlay.show(
                    context: context,
                    type: DSAlertTypeEnum.error,
                    title: state.message,
                  );
                }
              },
              builder: (context, state) {
                if (state is TVShowDetailsLoading) {
                  return const DSDetailsShimmer();
                }
                if (state is TVShowDetailsSuccess) {
                  return _details(state.details);
                }
                return Container();
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _details(TVShowDetailsEntity details) {
    return Column(
      children: [
        DSBackdropCard(
          posterPath: APIInfo.requestPosterImage(details.posterPath!),
          backdropPath: APIInfo.requestBackdropImage(details.backdropPath),
          title:
              '${details.name} ${details.firstAirDate != null ? '(${details.firstAirDate!.yyyy})' : ''}',
          dateText: details.firstAirDate?.dayMonthYear,
          tagline: details.tagline,
          onTapBackButton: () => navigatorKey.currentState!.pop(),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (details.overview.isNotEmpty) ...[
                _getText(
                  text: 'Sinopse',
                  fontSize: 17,
                  isBold: true,
                ),
                const SizedBox(height: 10),
                _getText(
                  text: details.overview,
                  fontSize: 14,
                  isBold: false,
                ),
                const SizedBox(height: 10),
              ],
              if (details.genres.isNotEmpty) ...[
                _getText(
                  text: 'Gênero',
                  fontSize: 17,
                  isBold: true,
                ),
                const SizedBox(height: 10),
                Wrap(
                  children: List.generate(
                    details.genres.length,
                    (index) => _getText(
                      text:
                          '${details.genres[index].name}${details.genres.length != index + 1 ? ', ' : ''}',
                      fontSize: 14,
                      isBold: false,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
              ],
              _getText(
                text: 'Estado',
                fontSize: 17,
                isBold: true,
              ),
              const SizedBox(height: 10),
              _getText(
                text: details.status.value,
                fontSize: 14,
                isBold: false,
              ),
              if (details.createdBy.isNotEmpty) ...[
                const SizedBox(height: 10),
                _getText(
                  text: 'Criador${details.createdBy.length > 1 ? 'es' : ''}',
                  fontSize: 17,
                  isBold: true,
                ),
                const SizedBox(height: 10),
                Wrap(
                  children: List.generate(
                    details.createdBy.length,
                    (index) => _getText(
                      text:
                          '${details.createdBy[index].name}${details.createdBy.length != index + 1 ? ', ' : ''}',
                      fontSize: 14,
                      isBold: false,
                    ),
                  ),
                ),
              ],
              if (details.lastEpisodeToAir != null &&
                  details.seasons.isNotEmpty) ...[
                const SizedBox(height: 10),
                _getText(
                  text: 'Última Temporada',
                  fontSize: 17,
                  isBold: true,
                ),
                const SizedBox(height: 10),
                TVShowDetailsCardWidget(
                  seasonNumber: details.lastEpisodeToAir!.seasonNumber,
                  voteAverage: details.seasons.last.voteAverage,
                  airDate: details.seasons.last.airDate,
                  episodeCount: details.seasons.last.episodeCount,
                  overview: details.seasons.last.overview,
                  lastEpisodeName: details.lastEpisodeToAir!.name,
                  posterPath: details.seasons.last.posterPath,
                ),
              ],
              if (details.networks.isNotEmpty) ...[
                const SizedBox(height: 10),
                _getText(
                  text: 'Emissora${details.networks.length > 1 ? 's' : ''}',
                  fontSize: 17,
                  isBold: true,
                ),
                const SizedBox(height: 10),
                Wrap(
                  spacing: 10.0,
                  runSpacing: 10.0,
                  children: List.generate(
                    details.networks.length,
                    (index) {
                      if (details.networks[index].logoPath != null) {
                        return InkWell(
                          child: DSCachedImage(
                            path: APIInfo.requestH30Image(
                              details.networks[index].logoPath!,
                            ),
                          ),
                          onTap: () {},
                        );
                      }
                      return InkWell(
                        child: _getText(
                          text: details.networks[index].name,
                          fontSize: 14,
                          isBold: true,
                        ),
                        onTap: () {},
                      );
                    },
                  ),
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }

  Widget _getText({
    required String text,
    required double fontSize,
    required bool isBold,
  }) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        color: Colors.white,
        fontWeight: isBold ? FontWeight.bold : null,
      ),
    );
  }
}
