import 'package:flutter/material.dart';

import '../images/ds_cached_image.dart';
import '../loading/ds_shimmer.dart';
import '../utils/ds_key_enum.dart';
import 'ds_no_image_card.dart';

class DSTopPosterCard extends StatelessWidget {
  const DSTopPosterCard({
    required this.title,
    required this.description,
    required this.onTap,
    this.height = 190,
    this.path,
    Key? key,
  }) : super(key: key);

  final String title;
  final String description;
  final VoidCallback onTap;
  final double height;
  final String? path;

  BorderRadius get _imageRadius => const BorderRadius.only(
        topLeft: Radius.circular(5.0),
        topRight: Radius.circular(5.0),
      );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (path != null)
              ClipRRect(
                borderRadius: _imageRadius,
                child: DSCachedImage(
                  key: Key(DSKeyEnum.cachedImage.name),
                  path: path!,
                  fit: BoxFit.cover,
                  placeholder: DSShimmer(
                    height: height,
                    borderRadius: _imageRadius,
                  ),
                ),
              )
            else
              DSNoImageCard(
                height: height,
                icon: Icons.person,
                iconSize: 100,
                borderRadius: _imageRadius,
              ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 1),
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.black45,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
