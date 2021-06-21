import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/data/models/movie/movie_item.dart';
import 'package:movie_app/screens/item_details_screen.dart';

class MovieItemList extends StatelessWidget {
  final List<MoviesItem> itemList;
  MovieItemList(this.itemList);

  goToItemDetails(int id) {
    Get.to(() => ItemDetails(id: id, isMovie: true));
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
                if (itemList[index].id != null)
                  goToItemDetails(itemList[index].id!);
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
                                    image: NetworkImage(itemList[index]
                                                .posterPath !=
                                            null
                                        ? '$imgBase${itemList[index].posterPath}'
                                        : 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/600px-No_image_available.svg.png'))),
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
                                width: mediaQuery.width * 0.50,
                                child: Text(
                                  itemList[index].title != null
                                      ? '${itemList[index].title}'
                                      : 'No title',
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
                            if (itemList[index].id != null)
                              goToItemDetails(itemList[index].id!);
                          },
                          icon: Icon(Icons.chevron_right))
                    ],
                  )),
            );
          }),
    );
  }
}
