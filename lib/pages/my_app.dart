import 'package:flutter/material.dart';
import 'package:movie_database_api/constants/color_theme.dart';

import '../constants/routes.dart';
import 'top_rated_movies.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          bottomAppBarColor: Colors.black,
          appBarTheme: const AppBarTheme(backgroundColor: darkBlue),
          textTheme: const TextTheme(
            headline2: TextStyle(color: Colors.white),
          ),
          cardTheme: CardTheme(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)))),
      debugShowCheckedModeBanner: false,
      home: const TopRatedMoviesPage(),
      routes: myRoutes,
    );
  }
}
