enum TVShowTypeEnum {
  popular('popular', 'populares'),
  airingToday('airing_today', 'emitidas hoje'),
  onTheAir('on_the_air', 'em Exibição'),
  topRated('top_rated', 'com melhor classificação');

  const TVShowTypeEnum(this.path, this.label);

  final String path;
  final String label;
}