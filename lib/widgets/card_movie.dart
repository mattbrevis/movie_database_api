import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CardMovieWidget extends StatelessWidget {
  final String title;
  final String imageMovie;
  final String overview;
  const CardMovieWidget(
      {Key? key,
      required this.title,
      required this.imageMovie,
      required this.overview})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.25,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * .4,
              child: CachedNetworkImage(
                imageUrl: 'https://image.tmdb.org/t/p/w500$imageMovie',
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
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width * .5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(overview.length > 300
                      ? '${overview.substring(0, 200)}...'
                      : overview),
                  const Text(
                    'Read more...',
                    style: TextStyle(color: Colors.grey),
                    textAlign: TextAlign.end,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
