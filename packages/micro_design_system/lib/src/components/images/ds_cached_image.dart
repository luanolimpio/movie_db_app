import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class DSCachedImage extends StatelessWidget {
  const DSCachedImage({
    required this.path,
    this.fit,
    this.placeholder,
    this.errorWidget,
    Key? key,
  }) : super(key: key);

  final String path;
  final BoxFit? fit;
  final Widget? placeholder;
  final Widget? errorWidget;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: path,
      fit: fit,
      placeholder: placeholder != null ? (_, __) => placeholder! : null,
      errorWidget: errorWidget != null ? (_, __, ___) => errorWidget! : null,
    );
  }
}
