import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class DSImage extends StatelessWidget {
  const DSImage({
    required this.path,
    this.onTap,
    Key? key,
  }) : super(key: key);

  final String path;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: CachedNetworkImage(
        imageUrl: path,
      ),
    );
  }
}
