import 'package:flutter/material.dart';
import 'package:micro_common/micro_common.dart';
import 'package:micro_design_system/micro_design_system.dart';

import '../../domain/entities/season_entity.dart';

class SeasonCardWidget extends StatelessWidget {
  const SeasonCardWidget({
    required this.season,
    this.lastEpisodeName,
    super.key,
  });

  final SeasonEntity season;
  final String? lastEpisodeName;

  @override
  Widget build(BuildContext context) {
    return DSSidePosterCard(
      path: season.posterPath != null
          ? APIInfo.requestH195Image(
              season.posterPath!,
            )
          : null,
      title: season.name,
      description: [
        Row(
          children: [
            if (season.voteAverage > 0) ...[
              Container(
                height: 20,
                padding: const EdgeInsets.all(3.0),
                decoration: BoxDecoration(
                  color: const Color(0xFF032541),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.white,
                      size: 13,
                    ),
                    Text(
                      '${season.voteAverage.toString().replaceAll('.', '')}%',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 13.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 5),
            ],
            if (season.airDate != null) ...[
              Text(
                season.airDate!.yyyy,
                style: const TextStyle(
                  fontSize: 13.0,
                ),
              ),
              const Text(
                ' • ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
            Text(
              '${season.episodeCount} Episódios',
              style: const TextStyle(
                fontSize: 13.0,
              ),
            ),
          ],
        ),
        if (season.overview.isNotEmpty) ...[
          const SizedBox(height: 10),
          Text(
            season.overview,
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
          )
        ] else if (season.airDate != null) ...[
          const SizedBox(height: 10),
          Text(
            'A ${season.seasonNumber}.ª temporada estreou ${season.airDate!.dayMonthYear}.',
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ],
        if (lastEpisodeName != null) ...[
          const SizedBox(height: 10),
          const Text(
            'Último Episódio:',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          Text(
            lastEpisodeName!,
            style: const TextStyle(
              decoration: TextDecoration.underline,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ],
    );
  }
}
