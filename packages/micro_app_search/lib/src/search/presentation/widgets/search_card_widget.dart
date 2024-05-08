import 'package:flutter/material.dart';
import 'package:micro_common/micro_common.dart';
import 'package:micro_design_system/micro_design_system.dart';

import '../../domain/entities/multi_search_entity.dart';

class SearchCardWidget extends StatelessWidget {
  const SearchCardWidget({
    required this.search,
    required this.onTap,
    super.key,
  });

  final MultiSearchEntity search;
  final VoidCallback onTap;

  bool get _hasKnownForContent =>
      search.mediaType == MediaTypeEnum.person &&
      search.knownFor != null &&
      search.knownFor!.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    return DSSidePosterCard(
      path: search.posterPath != null
          ? APIInfo.requestH141Image(
              search.posterPath!,
            )
          : null,
      height: 141,
      width: 94,
      title: search.name,
      description: [
        Text(
          _getDescription(),
          maxLines: 4,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 13,
            color: Colors.black45,
          ),
        ),
      ],
      onTap: onTap,
    );
  }

  String _getDescription() {
    if (_hasKnownForContent) {
      return 'Atuação • ${search.knownFor!.titles}';
    }
    return search.overview ?? 'Sinopse não informada';
  }
}
