import 'package:flutter/material.dart';
import '../arguments/seasons_arguments.dart';
import '../widgets/season_card_widget.dart';

class SeasonsScreen extends StatelessWidget {
  const SeasonsScreen({
    required this.arguments,
    super.key,
  });

  final SeasonsArguments arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Temporadas de ${arguments.tvShowName}',
        ),
        leadingWidth: 40,
      ),
      body: ListView.separated(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(10),
        itemCount: arguments.seasons.length,
        separatorBuilder: (_, index) => const SizedBox(
          height: 10,
        ),
        itemBuilder: (_, index) {
          return SeasonCardWidget(
            season: arguments.seasons[index],
          );
        },
      ),
    );
  }
}
