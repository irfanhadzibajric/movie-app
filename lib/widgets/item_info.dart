import 'package:flutter/material.dart';

class ItemInfo extends StatelessWidget {
  final dynamic item;
  final bool isMovie;

  const ItemInfo({Key? key, required this.isMovie, required this.item})
      : super(key: key);

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
                image: NetworkImage('$imgBase${item['backdrop_path']}'),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 20, left: 10),
            height: mediaQurey.height * 0.1,
            child: Text(
              '${isMovie ? item['title'] : item['name']}',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 0, left: 10),
            height: mediaQurey.height * 0.4,
            child: Text(
              '${item['overview']}',
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
