import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../utils/ds_key_enum.dart';
import 'ds_no_image_card.dart';
import 'ds_poster_card.dart';

class DSBackdropCard extends StatelessWidget {
  const DSBackdropCard({
    required this.title,
    required this.tagline,
    required this.onTapBackButton,
    this.posterPath,
    this.backdropPath,
    this.subtitle,
    Key? key,
  }) : super(key: key);

  final String title;
  final String tagline;
  final String? posterPath;
  final String? backdropPath;
  final String? subtitle;
  final VoidCallback onTapBackButton;

  @override
  Widget build(BuildContext context) {
    return Stack(
      key: Key(DSKeyEnum.backdropCard.name),
      alignment: Alignment.center,
      children: [
        Container(
          height: 300,
          decoration: backdropPath != null
              ? BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      Colors.white.withOpacity(0.3),
                      BlendMode.modulate,
                    ),
                    image: CachedNetworkImageProvider(
                      backdropPath!,
                    ),
                  ),
                )
              : const BoxDecoration(
                  color: Color(0xFF404040),
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
              if (posterPath != null)
                DSPosterCard(
                  path: posterPath!,
                )
              else
                DSNoImageCard(
                  height: 200,
                  width: MediaQuery.of(context).size.width / 3,
                  icon: Icons.image,
                  iconSize: 100,
                  borderRadius: BorderRadius.circular(5.0),
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
                    if (subtitle != null) ...[
                      const SizedBox(height: 5),
                      Text(
                        subtitle!,
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
