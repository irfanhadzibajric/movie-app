import 'package:flutter/material.dart';
import 'package:movie_app/data/models/movie/movie_info.dart';

class MovieInfoWidget extends StatelessWidget {
  final MovieInfo item;

  const MovieInfoWidget({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQurey = MediaQuery.of(context).size;
    const imgBase = "https://image.tmdb.org/t/p/w500";
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: mediaQurey.height * 0.3,
            width: mediaQurey.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(item.backdropPath != null
                    ? '$imgBase${item.backdropPath}'
                    : 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/600px-No_image_available.svg.png'),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              item.title != null ? '${item.title}' : 'No title',
              style: TextStyle(
                fontSize: mediaQurey.height * 0.04,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              item.overview != null ? '${item.overview}' : 'No description.',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
          )
        ],
      ),
    );
  }
}
