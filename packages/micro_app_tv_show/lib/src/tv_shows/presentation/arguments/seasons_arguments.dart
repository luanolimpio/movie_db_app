import '../../domain/entities/season_entity.dart';

class SeasonsArguments {
  const SeasonsArguments({
    required this.tvShowName,
    required this.seasons,
  });

  final String tvShowName;
  final List<SeasonEntity> seasons;
}
