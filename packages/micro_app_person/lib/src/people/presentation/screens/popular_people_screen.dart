import 'package:flutter/material.dart';
import 'package:micro_dependencies/micro_dependencies.dart';

import '../bloc/person_bloc.dart';
import '../bloc/person_event.dart';

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
    );
  }
}
