import 'package:flutter/material.dart';

import '../images/ds_cached_image.dart';
import '../loading/ds_shimmer.dart';

class DSSidePosterCard extends StatelessWidget {
  const DSSidePosterCard({
    required this.title,
    required this.description,
    this.height = 195,
    this.width = 130,
    this.path,
    this.onTap,
    Key? key,
  }) : super(key: key);

  final String title;
  final List<Widget> description;
  final double height;
  final double width;
  final String? path;
  final VoidCallback? onTap;

  BorderRadius get _imageRadius => const BorderRadius.only(
        topLeft: Radius.circular(5.0),
        bottomLeft: Radius.circular(5.0),
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
        child: Row(
          children: [
            if (path != null)
              ClipRRect(
                borderRadius: _imageRadius,
                child: DSCachedImage(
                  path: path!,
                  placeholder: DSShimmer(
                    height: height,
                    width: width,
                    borderRadius: _imageRadius,
                  ),
                ),
              )
            else
              Container(
                height: height,
                width: width,
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
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    ...description,
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
