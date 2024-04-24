import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'ds_poster_card.dart';

class DSBackdropCard extends StatelessWidget {
  const DSBackdropCard({
    required this.posterPath,
    required this.backdropPath,
    required this.title,
    required this.dateText,
    required this.tagline,
    this.onTapBackButton,
    Key? key,
  }) : super(key: key);

  final String posterPath;
  final String backdropPath;
  final String title;
  final String? dateText;
  final String tagline;
  final VoidCallback? onTapBackButton;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 300,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.3),
                BlendMode.modulate,
              ),
              image: CachedNetworkImageProvider(
                backdropPath,
              ),
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: onTapBackButton,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              DSPosterCard(
                path: posterPath,
              ),
              const SizedBox(width: 10),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 19,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (dateText != null) ...[
                      const SizedBox(height: 5),
                      Text(
                        dateText!,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ],
                    if (tagline.isNotEmpty) ...[
                      const SizedBox(height: 10),
                      Text(
                        tagline,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ]
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
