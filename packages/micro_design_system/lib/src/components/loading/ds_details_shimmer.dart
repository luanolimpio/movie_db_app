import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ds_shimmer.dart';

class DSDetailsShimmer extends StatelessWidget {
  const DSDetailsShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DSShimmer(
          height: 300,
          borderRadius: BorderRadius.zero,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DSShimmer(
                height: 20,
                width: 90,
              ),
              SizedBox(height: 10),
              DSShimmer(
                height: 80,
              ),
              SizedBox(height: 10),
              DSShimmer(
                height: 20,
                width: 140,
              ),
              SizedBox(height: 10),
              DSShimmer(
                height: 20,
              ),
              SizedBox(height: 10),
              DSShimmer(
                height: 20,
                width: 90,
              ),
              SizedBox(height: 10),
              DSShimmer(
                height: 20,
              ),
            ],
          ),
        )
      ],
    );
  }
}
