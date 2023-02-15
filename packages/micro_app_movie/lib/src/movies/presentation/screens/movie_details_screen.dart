import 'package:flutter/material.dart';
import 'package:micro_common/micro_common.dart';
import 'package:micro_core/micro_core.dart';
import 'package:micro_dependencies/micro_dependencies.dart';
import 'package:micro_design_system/micro_design_system.dart';

import '../../domain/entities/movie_details_entity.dart';
import '../bloc/movie_bloc.dart';
import '../bloc/movie_event.dart';
import '../bloc/movie_state.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({
    required this.movieId,
    Key? key,
  }) : super(key: key);

  final int movieId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.I<MovieBloc>()..add(GetDetailsEvent(id: movieId)),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: BlocConsumer<MovieBloc, MovieState>(
              listener: (context, state) {
                if (state is MovieDetailsError) {
                  navigatorKey.currentState!.pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.red.withOpacity(0.4),
                      duration: const Duration(seconds: 3),
                      padding: const EdgeInsets.all(20),
                      behavior: SnackBarBehavior.floating,
                      content: Row(
                        children: [
                          const Icon(
                            Icons.info_outline_rounded,
                            color: Colors.white,
                            size: 25,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            state.message,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }
              },
              builder: (context, state) {
                if (state is MovieDetailsLoading) {
                  return const DSDetailsShimmer();
                }
                if (state is MovieDetailsSuccess) {
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

  Widget _details(MovieDetailsEntity details) {
    return Column(
      children: [
        DSBackdropCard(
          posterPath: APIInfo.requestPosterImage(details.posterPath!),
          backdropPath: APIInfo.requestBackdropImage(details.backdropPath),
          title: '${details.title} (${details.releaseDate.yyyy})',
          dateText: details.releaseDate.dayMonthYear,
          tagline: details.tagline.isNotEmpty ? details.tagline : null,
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
              ],
              const SizedBox(height: 10),
              _getText(
                text: 'Nome original',
                fontSize: 17,
                isBold: true,
              ),
              const SizedBox(height: 10),
              _getText(
                text: details.originalTitle,
                fontSize: 14,
                isBold: false,
              ),
              const SizedBox(height: 10),
              _getText(
                text: 'Gênero',
                fontSize: 17,
                isBold: true,
              ),
              const SizedBox(height: 10),
              Row(
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
