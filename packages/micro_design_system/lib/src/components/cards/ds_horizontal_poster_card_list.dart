import 'package:flutter/material.dart';

import 'ds_poster_card.dart';

class DSHorizontalPosterCardList extends StatelessWidget {
  const DSHorizontalPosterCardList({
    required this.posterCards,
    Key? key,
  }) : super(key: key);

  final List<DSPosterCard> posterCards;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: posterCards.length,
        itemBuilder: (_, index) {
          return Padding(
            padding: index != posterCards.length - 1
                ? const EdgeInsets.only(right: 10)
                : EdgeInsets.zero,
            child: posterCards[index],
          );
        },
      ),
    );
  }
}
