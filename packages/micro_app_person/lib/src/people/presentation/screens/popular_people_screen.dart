import 'package:flutter/material.dart';
import 'package:micro_common/micro_common.dart';
import 'package:micro_core/micro_core.dart';
import 'package:micro_dependencies/micro_dependencies.dart';
import 'package:micro_design_system/micro_design_system.dart';

import '../../../core/routes/person_routes.dart';
import '../arguments/person_details_arguments.dart';
import '../bloc/list/person_bloc.dart';
import '../bloc/list/person_event.dart';
import '../bloc/list/person_state.dart';
import '../widgets/person_card_widget.dart';

class PopularPeopleScreen extends StatefulWidget {
  const PopularPeopleScreen({super.key});

  @override
  State<PopularPeopleScreen> createState() => _PopularPeopleScreenState();
}

class _PopularPeopleScreenState extends State<PopularPeopleScreen>
    implements IPaginationController {
  late final PaginationScrollController _paginationController;
  late final PersonBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of<PersonBloc>(context)
      ..add(const GetPopularPeopleEvent());
    _paginationController = PaginationScrollController(delegate: this);
  }

  @override
  void dispose() {
    _paginationController.dispose();
    super.dispose();
  }

  @override
  void loadMore() {
    _bloc.add(const GetPopularPeopleEvent());
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
              if (state.currentPage == 1) navigatorKey.currentState!.pop();
              DSAlertOverlay.show(
                context: context,
                type: DSAlertTypeEnum.error,
                title: state.message,
              );
            }
          },
          builder: (context, state) {
            if (state is PopularPeopleLoading && state.currentPage == 1) {
              return const DSVerticalPosterListShimmer(
                crossAxisCount: 2,
                height: 250,
              );
            }
            if (state.people.isNotEmpty) {
              return GridView.builder(
                controller: _paginationController,
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  mainAxisExtent: 250,
                ),
                itemCount: state.people.length + 2,
                itemBuilder: (_, index) {
                  if (index < state.people.length) {
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
                  } else {
                    return const DSShimmer();
                  }
                },
              );
            } else {
              return const DSEmptyState();
            }
          },
        ),
      ),
    );
  }
}
