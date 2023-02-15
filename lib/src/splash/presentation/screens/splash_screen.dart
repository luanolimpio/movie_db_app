import 'package:flutter/material.dart';
import 'package:micro_core/micro_core.dart';
import 'package:micro_dependencies/micro_dependencies.dart';

import '../../../core/routes/base_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _animationController.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        navigatorKey.currentState!.pushReplacementNamed(BaseRoutes.home);
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: Lottie.asset(
          'assets/splash_logo.json',
          height: 250,
          width: 250,
          controller: _animationController,
          onLoaded: (_) {
            _animationController.forward();
          },
        ),
      ),
    );
  }
}
