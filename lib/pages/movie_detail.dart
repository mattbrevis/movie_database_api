// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_database_api/models/movie_model.dart';
import 'package:movie_database_api/utils/platform_details.dart';

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
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: PlatformDetails().isMobile? 500: 300,
            child: Hero(
                tag: movieModel.id,

                child: CachedNetworkImage(
                  imageUrl: PlatformDetails().isDesktop ? 'https://image.tmdb.org/t/p/w500${movieModel.backdropPath}' :
                      'https://image.tmdb.org/t/p/w500${movieModel.posterPath}',
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: imageProvider,
                        fit: PlatformDetails().isMobile? BoxFit.fill : BoxFit.fitHeight,
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
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    movieModel.title,
                    style: Theme.of(context).textTheme.titleLarge,
                    textAlign: TextAlign.center,
                  ),
                ),
                Text(
                  'Overview: ${movieModel.overview}',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  '\nRelease Date: $dtReleaseMask',
                  style: Theme.of(context).textTheme.bodySmall,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
