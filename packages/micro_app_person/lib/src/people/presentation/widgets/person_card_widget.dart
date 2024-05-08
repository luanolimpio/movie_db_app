import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return DSTopPosterCard(
      path: person.profilePath != null
          ? APIInfo.requestH235Image(
              person.profilePath!,
            )
          : null,
      title: person.name,
      description: person.knownFor.titles,
      onTap: onTap,
    );
  }
}
