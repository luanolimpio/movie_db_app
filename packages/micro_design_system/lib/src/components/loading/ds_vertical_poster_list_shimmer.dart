import 'package:flutter/material.dart';

import 'ds_shimmer.dart';

class DSVerticalPosterListShimmer extends StatelessWidget {
  const DSVerticalPosterListShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        mainAxisExtent: 200,
      ),
      itemCount: 9,
      itemBuilder: (BuildContext context, int index) {
        return const DSShimmer();
      },
    );
  }
}
