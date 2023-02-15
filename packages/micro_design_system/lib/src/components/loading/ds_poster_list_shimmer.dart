import 'package:flutter/material.dart';

import 'ds_shimmer.dart';

class DSPosterListShimmer extends StatelessWidget {
  const DSPosterListShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (_, index) {
          return Padding(
            padding: index == 0
                ? const EdgeInsets.symmetric(horizontal: 10)
                : const EdgeInsets.only(right: 10),
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
