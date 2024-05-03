import 'package:flutter/material.dart';

import 'ds_poster_card.dart';

class DSVerticalPosterCardList extends StatelessWidget {
  const DSVerticalPosterCardList({
    required this.posterCards,
    super.key,
  });

  final List<DSPosterCard> posterCards;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        mainAxisExtent: 200,
      ),
      itemCount: posterCards.length,
      itemBuilder: (_, index) {
        return posterCards[index];
      },
    );
  }
}
