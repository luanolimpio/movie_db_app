import 'dart:ui';

import 'package:micro_common/micro_common.dart';
import 'package:micro_core/micro_core.dart';
import 'package:micro_dependencies/micro_dependencies.dart';

import 'core/injector/injector.dart';
import 'core/routes/person_routes.dart';
import 'people/presentation/bloc/person_bloc.dart';
import 'people/presentation/screens/popular_people_screen.dart';

class MicroAppPersonResolver implements MicroApp {
  @override
  String get microAppName => 'micro_app_person';

  @override
  Map<String, WidgetBuilderArgs> get routes => {
        PersonRoutes.list: (_, args) => BlocProvider<PersonBloc>(
              create: (_) => GetIt.I<PersonBloc>(),
              child: const PopularPeopleScreen(),
            ),
      };

  @override
  VoidCallback get injection => Injector.initialize;

  @override
  VoidCallback get eventListener => () {
        EventBus.listen(
          (event) {
            switch (event.runtimeType) {
              case GoToPopularPeopleEvent:
                navigatorKey.currentState!.pushNamed(
                  PersonRoutes.list,
                );
                break;
              default:
            }
          },
        );
      };
}
