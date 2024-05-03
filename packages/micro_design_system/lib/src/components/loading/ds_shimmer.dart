import 'package:flutter/material.dart';

import 'shimmer.dart';

class DSShimmer extends StatelessWidget {
  const DSShimmer({
    this.height,
    this.width,
    this.baseColor,
    this.highlightColor,
    this.borderRadius,
    Key? key,
  }) : super(key: key);

  final Color? baseColor;
  final Color? highlightColor;
  final double? height;
  final double? width;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: baseColor ?? Colors.grey.shade700,
      highlightColor: highlightColor ?? Colors.grey.shade600,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: borderRadius ?? BorderRadius.circular(5.0),
        ),
      ),
    );
  }
}
