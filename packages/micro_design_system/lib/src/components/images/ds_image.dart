import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class DSImage extends StatelessWidget {
  const DSImage({
    required this.path,
    Key? key,
  }) : super(key: key);

  final String path;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: path,
    );
  }
}
