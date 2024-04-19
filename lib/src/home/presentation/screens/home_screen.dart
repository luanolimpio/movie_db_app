import 'package:flutter/material.dart';
import 'package:micro_app_movie/micro_app_movie.dart';
import 'package:micro_app_tv_show/micro_app_tv_show.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MovieCards(),
              SizedBox(height: 10),
              TVShowCards(),
            ],
          ),
        ),
      ),
    );
  }
}
