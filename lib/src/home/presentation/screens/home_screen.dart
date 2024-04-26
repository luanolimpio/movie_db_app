import 'package:flutter/material.dart';
import 'package:micro_app_movie/micro_app_movie.dart';
import 'package:micro_app_tv_show/micro_app_tv_show.dart';

import '../widgets/home_drawer_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const HomeDrawerWidget(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                child: const Icon(
                  Icons.menu,
                  color: Colors.white,
                  // size: 24,
                ),
                onTap: () {
                  _scaffoldKey.currentState?.openDrawer();
                },
              ),
              const SizedBox(height: 10),
              const MovieCards(),
              const SizedBox(height: 10),
              const TVShowCards(),
            ],
          ),
        ),
      ),
    );
  }
}
