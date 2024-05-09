import 'package:flutter/material.dart';
import 'package:micro_common/micro_common.dart';
import 'package:micro_core/micro_core.dart';
import 'package:micro_dependencies/micro_dependencies.dart';
import 'package:micro_design_system/micro_design_system.dart';

import '../../domain/entities/person_details_entity.dart';
import '../arguments/person_details_arguments.dart';
import '../bloc/details/person_details_bloc.dart';
import '../bloc/details/person_details_event.dart';
import '../bloc/details/person_details_state.dart';

class PersonDetailsScreen extends StatelessWidget {
  const PersonDetailsScreen({
    required this.arguments,
    super.key,
  });

  final PersonDetailsArguments arguments;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.I<PersonDetailsBloc>()
        ..add(GetPersonDetailsEvent(id: arguments.id)),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: BlocConsumer<PersonDetailsBloc, PersonDetailsState>(
              listener: (context, state) {
                if (state is PersonDetailsError) {
                  navigatorKey.currentState!.pop();
                  DSAlertOverlay.show(
                    context: context,
                    type: DSAlertTypeEnum.error,
                    title: state.message,
                  );
                }
              },
              builder: (context, state) {
                if (state is PersonDetailsLoading) {
                  return const DSDetailsShimmer();
                }
                if (state is PersonDetailsSuccess) {
                  return _details(state.details, context);
                }
                return Container();
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _details(PersonDetailsEntity details, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DSBackdropCard(
          posterPath: details.profilePath != null
              ? APIInfo.requestPosterImage(details.profilePath!)
              : null,
          title: details.name,
          subtitle: details.birthday != null
              ? '${details.birthday!.age} anos de idade'
              : null,
          tagline: 'Reconhecido(a) por: ${details.knownForDepartment.value}',
          onTapBackButton: () => navigatorKey.currentState!.pop(),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (details.biography.isNotEmpty) ...[
                _getText(
                  text: 'Biografia',
                  fontSize: 17,
                  isBold: true,
                ),
                const SizedBox(height: 10),
                _getText(
                  text: details.biography,
                  fontSize: 14,
                  isBold: false,
                ),
                const SizedBox(height: 10),
              ],
              if (arguments.knownFor.isNotEmpty) ...[
                _getText(
                  text: 'Reconhecido(a) por',
                  fontSize: 17,
                  isBold: true,
                ),
                const SizedBox(height: 10),
                DSHorizontalPosterCardList(
                  posterCards: List.generate(
                    arguments.knownFor.length,
                    (index) {
                      final knownFor = arguments.knownFor[index];
                      return DSPosterCard(
                        path: APIInfo.requestPosterImage(
                          knownFor.posterPath,
                        ),
                        onTap: () {
                          if (knownFor.mediaType == MediaTypeEnum.movie) {
                            EventBus.emit(
                              GoToMovieDetailsEvent(id: knownFor.id),
                            );
                          } else {
                            EventBus.emit(
                              GoToTVShowDetailsEvent(id: knownFor.id),
                            );
                          }
                        },
                      );
                    },
                  ),
                ),
              ],
              if (details.birthday != null) ...[
                const SizedBox(height: 10),
                _getText(
                  text: 'Nasceu em',
                  fontSize: 17,
                  isBold: true,
                ),
                const SizedBox(height: 10),
                _getText(
                  text:
                      '${details.birthday!.dayMonthYear} (idade ${details.birthday!.age} anos)',
                  fontSize: 14,
                  isBold: false,
                ),
              ],
              if (details.deathDay != null) ...[
                const SizedBox(height: 10),
                _getText(
                  text: 'Faleceu em',
                  fontSize: 17,
                  isBold: true,
                ),
                const SizedBox(height: 10),
                _getText(
                  text:
                      '${details.deathDay!.dayMonthYear} (idade ${details.deathDay!.age} anos)',
                  fontSize: 14,
                  isBold: false,
                ),
              ],
              const SizedBox(height: 10),
              _getText(
                text: 'Sexo',
                fontSize: 17,
                isBold: true,
              ),
              const SizedBox(height: 10),
              _getText(
                text: details.gender.label,
                fontSize: 14,
                isBold: false,
              ),
              const SizedBox(height: 10),
              _getText(
                text: 'Local de nascimento',
                fontSize: 17,
                isBold: true,
              ),
              const SizedBox(height: 10),
              _getText(
                text: details.placeOfBirth,
                fontSize: 14,
                isBold: false,
              ),
              if (details.alsoKnownAs.isNotEmpty) ...[
                const SizedBox(height: 10),
                _getText(
                  text: 'Nome por qual também é conhecido(a)',
                  fontSize: 17,
                  isBold: true,
                ),
                const SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(
                    details.alsoKnownAs.length,
                    (index) => Padding(
                      padding: details.alsoKnownAs.length != index + 1
                          ? const EdgeInsets.only(bottom: 10)
                          : EdgeInsets.zero,
                      child: _getText(
                        text: details.alsoKnownAs[index],
                        fontSize: 14,
                        isBold: false,
                      ),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }

  Widget _getText({
    required String text,
    required double fontSize,
    required bool isBold,
  }) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        color: Colors.white,
        fontWeight: isBold ? FontWeight.bold : null,
      ),
    );
  }
}
