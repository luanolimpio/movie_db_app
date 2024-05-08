import 'package:micro_common/micro_common.dart';
import 'package:micro_dependencies/micro_dependencies.dart';

class MultiSearchEntity extends Equatable {
  const MultiSearchEntity({
    required this.adult,
    required this.id,
    required this.name,
    required this.originalName,
    required this.mediaType,
    this.overview,
    this.posterPath,
    this.knownFor,
  });

  final bool adult;
  final int id;
  final String name;
  final String originalName;
  final String? overview;
  final MediaTypeEnum mediaType;
  final String? posterPath;
  final List<KnownForEntity>? knownFor;

  @override
  String toString() {
    return 'MultiSearchResultEntity(adult: $adult,'
        ' id: $id,'
        ' name: $name,'
        ' originalName: $originalName,'
        ' overview: $overview,'
        ' mediaType: $mediaType,'
        ' posterPath: $posterPath,'
        ' knownFor: $knownFor)';
  }

  @override
  List<Object?> get props => [
        adult,
        id,
        name,
        originalName,
        overview,
        mediaType,
        posterPath,
        knownFor,
      ];
}
