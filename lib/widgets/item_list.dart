import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/screens/item_details_screen.dart';

class ItemList extends StatelessWidget {
  final bool isMovie;
  final List itemList;
  ItemList(this.itemList, this.isMovie);

  goToItemDetails(int id, bool isMovie) {
    Get.to(() => MovieDetails(id: id, isMovie: isMovie));
  }

  @override
  Widget build(BuildContext context) {
    const imgBase = "https://image.tmdb.org/t/p/w500";
    var mediaQuery = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: ListView.separated(
          separatorBuilder: (context, int index) => Container(
                child: const Divider(
                  color: Colors.grey,
                  thickness: 0.8,
                ),
              ),
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: itemList.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
                goToItemDetails(itemList[index]['id'], isMovie);
              },
              child: Container(
                  height: 90.0,
                  color: Colors.transparent,
                  padding: EdgeInsets.only(left: 10),
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
                              Container(
                                width: mediaQuery.width * 0.55,
                                child: Text(
                                  isMovie
                                      ? '${itemList[index]['title']}'
                                      : '${itemList[index]['name']}',
                                  style: TextStyle(
                                    fontSize: mediaQuery.height * 0.023,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Text(
                                'Description',
                                style: TextStyle(
                                    color: Colors.grey[500],
                                    fontSize: mediaQuery.height * 0.015),
                              )
                            ],
                          ),
                        ],
                      ),
                      IconButton(
                          onPressed: () {
                            goToItemDetails(itemList[index]['id'], isMovie);
                          },
                          icon: Icon(Icons.chevron_right))
                    ],
                  )),
            );
          }),
    );
  }
}
