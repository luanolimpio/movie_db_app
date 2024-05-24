import 'package:flutter/material.dart';

import '../images/ds_cached_image.dart';
import '../loading/ds_shimmer.dart';
import '../utils/ds_key_enum.dart';
import 'ds_no_image_card.dart';

class DSPosterCard extends StatelessWidget {
  const DSPosterCard({
    required this.path,
    this.onTap,
    Key? key,
  }) : super(key: key);

  final String path;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: Key(DSKeyEnum.posterCard.name),
      onTap: onTap,
      child: SizedBox(
        height: 200,
        width: MediaQuery.of(context).size.width / 3,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5.0),
          child: DSCachedImage(
            path: path,
            fit: BoxFit.cover,
            placeholder: DSShimmer(
              height: 200,
              width: MediaQuery.of(context).size.width / 3,
            ),
            errorWidget: DSNoImageCard(
              height: 200,
              width: MediaQuery.of(context).size.width / 3,
              icon: Icons.image,
              iconSize: 50,
            ),
          ),
        ),
      ),
    );
  }
}
