import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../loading/ds_shimmer.dart';

class DSPosterCard extends StatelessWidget {
  const DSPosterCard({
    required this.path,
    this.onTap,
    Key? key,
  }) : super(key: key);

  final String path;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 200,
        width: MediaQuery.of(context).size.width / 3,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5.0),
          child: CachedNetworkImage(
            imageUrl: path,
            fit: BoxFit.cover,
            placeholder: (_, __) => DSShimmer(
              height: 200,
              width: MediaQuery.of(context).size.width / 3,
            ),
          ),
        ),
      ),
    );
  }
}
