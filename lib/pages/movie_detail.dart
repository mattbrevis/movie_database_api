// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_database_api/models/movie_model.dart';

class MovieDetail extends StatelessWidget {
  final MovieModel movieModel;
  const MovieDetail({
    Key? key,
    required this.movieModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String dtReleaseMask = '${movieModel.releaseDate.year}-${movieModel.releaseDate.month}-${movieModel.releaseDate.day}';

    return Scaffold(
      appBar: AppBar(title: Text(movieModel.title)),
      body: Column(
        children: [
          SizedBox(
            height: 500,
            child: Hero(
                tag: movieModel.id,

                child: CachedNetworkImage(
                  imageUrl:
                      'https://image.tmdb.org/t/p/w500${movieModel.posterPath}',
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(
                    strokeWidth: 2,
                  )),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Overview: ${movieModel.overview}',
                  style: const TextStyle(fontSize: 20, color: Colors.grey),
                ),
                Text(
                  'Release Date: $dtReleaseMask',
                  style: const TextStyle(fontSize: 16, color: Colors.grey),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
