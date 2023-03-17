import 'package:flutter/material.dart';
import 'package:movie_database_api/constants/theme.dart';
import 'top_rated_movies.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: myTheme,
      debugShowCheckedModeBanner: false,
      home: const TopRatedMoviesPage(),
     
    );
  }
}
