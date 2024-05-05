import 'package:flutter/material.dart';

import 'ds_shimmer.dart';

class DSVerticalPosterListShimmer extends StatelessWidget {
  const DSVerticalPosterListShimmer({
    required this.crossAxisCount,
    required this.height,
    super.key,
  });

  final int crossAxisCount;
  final double height;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        mainAxisExtent: height,
      ),
      itemCount: 9,
      itemBuilder: (BuildContext context, int index) {
        return const DSShimmer();
      },
    );
  }
}
