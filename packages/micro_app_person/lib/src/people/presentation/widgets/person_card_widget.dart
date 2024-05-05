import 'package:flutter/material.dart';
import 'package:micro_app_person/src/core/utils/person_extension.dart';
import 'package:micro_common/micro_common.dart';
import 'package:micro_design_system/micro_design_system.dart';

import '../../domain/entities/person_entity.dart';

class PersonCardWidget extends StatelessWidget {
  const PersonCardWidget({
    required this.person,
    required this.onTap,
    super.key,
  });

  final PersonEntity person;
  final VoidCallback onTap;

  BorderRadius get _imageRadius => const BorderRadius.only(
        topLeft: Radius.circular(5.0),
        topRight: Radius.circular(5.0),
      );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: _imageRadius,
              child: DSCachedImage(
                path: APIInfo.requestH235Image(
                  person.profilePath,
                ),
                fit: BoxFit.cover,
                placeholder: DSShimmer(
                  height: 190,
                  borderRadius: _imageRadius,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    person.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    person.knownForTitles,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.black45,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
