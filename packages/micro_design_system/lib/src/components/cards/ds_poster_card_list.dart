import 'package:flutter/material.dart';

import 'ds_poster_card.dart';

class DSPosterCardList extends StatelessWidget {
  const DSPosterCardList({
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
            padding: index == 0
                ? const EdgeInsets.symmetric(horizontal: 10)
                : const EdgeInsets.only(right: 10),
            child: posterCards[index],
          );
        },
      ),
    );
  }
}
