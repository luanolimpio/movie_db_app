import 'package:flutter/material.dart';

import 'ds_shimmer.dart';

class DSHorizontalPosterListShimmer extends StatelessWidget {
  const DSHorizontalPosterListShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (_, index) {
          return Padding(
            padding: index != 4
                ? const EdgeInsets.only(right: 10)
                : EdgeInsets.zero,
            child: DSShimmer(
              height: 200,
              width: MediaQuery.of(context).size.width / 3,
            ),
          );
        },
      ),
    );
  }
}
