class APIInfo {
  static const String baseUrl = 'https://api.themoviedb.org/3/';
  static const String key = '16d5fddfd308a627123f00b71738543f';
  static const String language = 'pt-BR';

  static const String _imageBaseUrl = 'https://image.tmdb.org/t/p/';

  static String requestPosterImage(String path) =>
      '${_imageBaseUrl}w220_and_h330_face$path';

  static String requestBackdropImage(String path) =>
      '${_imageBaseUrl}w1920_and_h800_multi_faces$path';

  static String requestH30Image(String path) =>
      '${_imageBaseUrl}h30$path';

  static String requestH195Image(String path) =>
      '${_imageBaseUrl}w130_and_h195_bestv2$path';

  static String requestH235Image(String path) =>
      '${_imageBaseUrl}w235_and_h235_face$path';

  static String requestH141Image(String path) =>
      '${_imageBaseUrl}w94_and_h141_bestv2$path';
}
