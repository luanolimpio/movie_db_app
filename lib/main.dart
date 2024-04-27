import 'package:flutter/material.dart';
import 'package:micro_app_movie/micro_app_movie.dart';
import 'package:micro_app_tv_show/micro_app_tv_show.dart';
import 'package:micro_core/micro_core.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'src/core/routes/base_routes.dart';
import 'src/home/presentation/screens/home_screen.dart';
import 'src/splash/presentation/screens/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget with BaseAppMixin {
  MyApp({super.key}) {
    super.registerRoutes();
    super.registerInjections();
    super.registerListeners();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFF333333),
        useMaterial3: false,
      ),
      locale: const Locale('pt', 'BR'),
      supportedLocales: const [Locale('pt', 'BR')],
      localizationsDelegates: const [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      navigatorKey: navigatorKey,
      onGenerateRoute: super.generateRoute,
      initialRoute: BaseRoutes.splash,
    );
  }

  @override
  Map<String, WidgetBuilderArgs> get baseRoutes => {
        BaseRoutes.splash: (_, __) => const SplashScreen(),
        BaseRoutes.home: (_, __) => const HomeScreen(),
      };

  @override
  List<MicroApp> get microApps => [
        MicroAppMovieResolver(),
        MicroAppTVShowResolver(),
      ];
}
