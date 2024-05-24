import 'package:flutter/material.dart';
import 'package:micro_app_movie/micro_app_movie.dart';
import 'package:micro_app_search/micro_app_search.dart';
import 'package:micro_app_tv_show/micro_app_tv_show.dart';
import 'package:micro_dependencies/micro_dependencies.dart';
import '../widgets/home_drawer_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const HomeDrawerWidget(),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () async {
              await showSearch(
                context: context,
                delegate: GetIt.I<CustomSearchDelegate>(),
              );
            },
            icon: const Icon(
              Icons.search,
              color: Colors.white,
              // size: 24,
            ),
          )
        ],
        leadingWidth: 40,
      ),
      body: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            MovieCardsWidget(),
            SizedBox(height: 10),
            TVShowCardsWidget(),
          ],
        ),
      ),
    );
  }
}
