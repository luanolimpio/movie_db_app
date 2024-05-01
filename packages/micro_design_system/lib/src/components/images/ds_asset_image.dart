import 'package:flutter/material.dart';

import 'ds_image_type_enum.dart';

class DSAssetImage extends StatelessWidget {
  const DSAssetImage({
    required this.image,
    this.height,
    this.width,
    this.fit,
    super.key,
  });

  final DSImageTypeEnum image;
  final double? height;
  final double? width;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image.path,
      package: 'micro_design_system',
      height: height,
      width: width,
      fit: fit,
    );
  }
}
