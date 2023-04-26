import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_database_api/models/movie_model.dart';
import 'package:movie_database_api/pages/movie_detail.dart';

import '../constants/api.dart';
import '../utils/platform_details.dart';

class CardMovieWidget extends StatelessWidget {
  final MovieModel movieModel;
  const CardMovieWidget(
      {Key? key,
      required this.movieModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: SizedBox(
        height: PlatformDetails().isMobile ? MediaQuery.of(context).size.height * 0.25 : 300,
        child: GestureDetector(
                onTap: (() {
                  Navigator.push(context,MaterialPageRoute(builder: (context) => MovieDetail(movieModel: movieModel,)
                  ,));
                }),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: PlatformDetails().isMobile ? MediaQuery.of(context).size.width * .4 : 200,              
                  child: Hero(
                    tag: movieModel.id,
                    child: CachedNetworkImage(
                      imageUrl:  Api.imageMovie+movieModel.posterPath,
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
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width * .5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      
                         Text(
                          movieModel.title,
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold)
                              ,
                        textAlign: TextAlign.center
                        ),
                      
                      Text(movieModel.overview.length > 300
                          ? '${movieModel.overview.substring(0, 200)}...'
                          : movieModel.overview , style: PlatformDetails().isMobile ? Theme.of(context).textTheme.bodySmall : Theme.of(context).textTheme.bodyText1, ),
                      const Text(
                        'Read more...',
                        style: TextStyle(color: Colors.grey),
                        textAlign: TextAlign.end,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
