import 'package:flutter/material.dart';
import 'package:movie_database_api/models/movie_model.dart';
import 'package:movie_database_api/repository/top_rated_imp.dart';
import 'package:movie_database_api/widgets/card_movie.dart';

class TopRatedMoviesPage extends StatefulWidget {
  const TopRatedMoviesPage({super.key});

  @override
  State<TopRatedMoviesPage> createState() => _TopRatedMoviesPageState();
}

class _TopRatedMoviesPageState extends State<TopRatedMoviesPage> {
  List<MovieModel> listMovie = [];
  bool isLoading = true;
  int page = 1;
  int totalPages = 0;
  final listController = ScrollController();
  loadTopRatedMovies() async {
    dynamic respTopRated = await TopRatedImp().getTopRated(page);
    List<MovieModel> list = respTopRated['listTopRated'];
    totalPages = respTopRated['totalPages'];
    if (listMovie.isEmpty) {
      listMovie = list;
    } else {
      listMovie.addAll(list);
    }
    setState(() {
      isLoading = false;
      if (page < totalPages) {
        page++;
      }
    });
  }

  @override
  void initState() {
    loadTopRatedMovies();
    listController.addListener(() {
      if (listController.position.maxScrollExtent == listController.offset && page<totalPages) {
        loadTopRatedMovies();
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    listController.dispose();
    super.dispose();
  }

  Widget listTopRatedMovies() => ListView.builder(
      controller: listController,
      itemCount: listMovie.length + 1,
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        if (index < listMovie.length) {
          return CardMovieWidget(movieModel: listMovie[index]);
        } else {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: page == totalPages
                  ? Container()
                  : const CircularProgressIndicator(),
            ),
          );
        }
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: const Text('The Movie Database - Top Rated Movies')),
      body: isLoading == true
          ? const Center(child: CircularProgressIndicator())
          : listMovie.isEmpty
              ? const Center(child: Text('No data'))
              : listTopRatedMovies(),
    );
  }
}
