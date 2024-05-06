import 'package:flutter/material.dart';
import 'package:micro_core/micro_core.dart';
import 'package:micro_dependencies/micro_dependencies.dart';
import 'package:micro_design_system/micro_design_system.dart';

import '../../../core/routes/person_routes.dart';
import '../arguments/person_details_arguments.dart';
import '../bloc/person_bloc.dart';
import '../bloc/person_event.dart';
import '../bloc/person_state.dart';
import '../widgets/person_card_widget.dart';

class PopularPeopleScreen extends StatefulWidget {
  const PopularPeopleScreen({super.key});

  @override
  State<PopularPeopleScreen> createState() => _PopularPeopleScreenState();
}

class _PopularPeopleScreenState extends State<PopularPeopleScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<PersonBloc>(context).add(const GetPopularPeopleEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pessoas populares',
        ),
        leadingWidth: 40,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: BlocConsumer<PersonBloc, PersonState>(
          listener: (context, state) {
            if (state is PopularPeopleError) {
              navigatorKey.currentState!.pop();
              DSAlertOverlay.show(
                context: context,
                type: DSAlertTypeEnum.error,
                title: state.message,
              );
            }
          },
          builder: (context, state) {
            if (state is PopularPeopleLoading) {
              return const DSVerticalPosterListShimmer(
                crossAxisCount: 2,
                height: 250,
              );
            }
            if (state is PopularPeopleSuccess) {
              if (state.people.isNotEmpty) {
                return GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    mainAxisExtent: 250,
                  ),
                  itemCount: state.people.length,
                  itemBuilder: (_, index) {
                    final person = state.people[index];
                    return PersonCardWidget(
                      person: person,
                      onTap: () {
                        navigatorKey.currentState!.pushNamed(
                          PersonRoutes.details,
                          arguments: PersonDetailsArguments(
                            id: person.id,
                            knownFor: person.knownFor,
                          ),
                        );
                      },
                    );
                  },
                );
              }
              return const DSEmptyState();
            }
            return Container();
          },
        ),
      ),
    );
  }
}
