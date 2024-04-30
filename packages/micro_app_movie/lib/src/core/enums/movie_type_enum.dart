enum MovieTypeEnum {
  popular('popular', 'populares'),
  nowPlaying('now_playing', 'em exibição'),
  upcoming('upcoming', 'a estrear em breve'),
  topRated('top_rated', 'com melhor classificação');

  const MovieTypeEnum(this.path, this.label);

  final String path;
  final String label;
}