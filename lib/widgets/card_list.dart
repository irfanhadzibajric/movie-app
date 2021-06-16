import 'package:flutter/material.dart';
import 'package:movie_app/widgets/navigation_bar.dart';
import 'package:movie_app/widgets/search_box.dart';

class CardList extends StatelessWidget {
  bool isMovie;
  List itemList;
  CardList(this.itemList, this.isMovie);

  @override
  Widget build(BuildContext context) {
    const imgBase = "https://image.tmdb.org/t/p/w500";
    var mediaQuery = MediaQuery.of(context).size;
    return Container(
      height: mediaQuery.height,
      width: mediaQuery.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          SearchBox(),
          NavigationBar(),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 7),
              child: ListView.separated(
                  separatorBuilder: (context, int index) => Container(
                        child: const Divider(
                          color: Colors.grey,
                          thickness: 0.8,
                        ),
                      ),
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                        height: 90.0,
                        color: Colors.transparent,
                        padding: EdgeInsets.all(0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 80,
                                  width: 80,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: NetworkImage(
                                              '$imgBase${itemList[index]['poster_path']}'))),
                                ),
                                SizedBox(
                                  width: 7,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      '${index + 1}',
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 7,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      isMovie
                                          ? '${itemList[index]['title']}'
                                          : '${itemList[index]['name']}',
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      softWrap: false,
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      'Description',
                                      style: TextStyle(color: Colors.grey[500]),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.chevron_right))
                          ],
                        ));
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
