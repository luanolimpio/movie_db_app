import 'package:flutter/material.dart';
import 'package:micro_common/micro_common.dart';
import 'package:micro_design_system/micro_design_system.dart';

class TVShowDetailsCardWidget extends StatelessWidget {
  const TVShowDetailsCardWidget({
    required this.posterPath,
    required this.seasonNumber,
    required this.voteAverage,
    required this.airDate,
    required this.episodeCount,
    required this.overview,
    required this.lastEpisodeName,
    super.key,
  });

  final String? posterPath;
  final int seasonNumber;
  final double voteAverage;
  final DateTime airDate;
  final int episodeCount;
  final String overview;
  final String lastEpisodeName;

  BorderRadius get _imageRadius => const BorderRadius.only(
        topLeft: Radius.circular(5.0),
        bottomLeft: Radius.circular(5.0),
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (posterPath != null)
            ClipRRect(
              borderRadius: _imageRadius,
              child: DSImage(
                path: APIInfo.requestH195Image(
                  posterPath!,
                ),
              ),
            )
          else
            Container(
              height: 195,
              width: 130,
              decoration: BoxDecoration(
                color: Colors.grey.shade400,
                borderRadius: _imageRadius,
              ),
              child: Icon(
                Icons.image,
                size: 40,
                color: Colors.grey.shade600,
              ),
            ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Temporada $seasonNumber',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      if (voteAverage > 0) ...[
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
                                '${voteAverage.toString().replaceAll('.', '')}%',
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
                      Text(
                        airDate.yyyy,
                        style: const TextStyle(
                          color: Colors.black87,
                          fontSize: 13.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Text(
                        ' - ',
                        style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        '$episodeCount Episódios',
                        style: const TextStyle(
                          color: Colors.black87,
                          fontSize: 13.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  if (overview.isNotEmpty)
                    Text(
                      overview,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    )
                  else
                    Text(
                      'A $seasonNumber.ª temporada estreou ${airDate.dayMonthYear}.',
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  const SizedBox(height: 10),
                  const Text(
                    'Último Episódio:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    lastEpisodeName,
                    style: const TextStyle(
                      decoration: TextDecoration.underline,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
