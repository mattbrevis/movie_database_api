import 'package:flutter/material.dart';
import 'package:movie_database_api/models/movie_model.dart';
import 'package:movie_database_api/repository/top_rated_imp.dart';
import 'package:movie_database_api/widgets/card_movie.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<MovieModel> listMovie = [];
  bool isLoading = true;
  loadTopRatedMovies() async {
    listMovie = await TopRatedImp().getTopRated();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState()  {
     loadTopRatedMovies();
    super.initState();
  }

  Widget listTopRatedMovies() => ListView.builder(
        itemCount: listMovie.length,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) => CardMovieWidget(
            imageMovie: listMovie[index].posterPath,
            title: listMovie[index].title,
            overview: listMovie[index].overview),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('The Movie Database - Top Rated Movies')),
      body: isLoading == true
          ? const Center(child: CircularProgressIndicator())
          : listMovie.isEmpty
              ? const Center(child: Text('No data'))
              : listTopRatedMovies(),
    );
  }
}
