import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:movie_app/bloc/movie_bloc/movie_bloc.dart';
import 'package:movie_app/bloc/show_bloc/show_bloc.dart';
import 'package:movie_app/screens/item_details_screen.dart';

class SearchBox extends StatelessWidget {
  final bool isMovie;
  const SearchBox({Key? key, required this.isMovie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isMovie
        ? BlocBuilder<MovieBloc, MovieState>(
            builder: (context, state) {
              if (state is MovieLoadedState) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.92,
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(15)),
                      child: TextField(
                        onTap: () {
                          FocusScope.of(context).requestFocus(FocusNode());
                          showSearch(
                              context: context,
                              delegate: ItemSearch(state.movies, isMovie));
                        },
                        decoration: InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.all(14),
                            border: InputBorder.none,
                            hintText: 'Search',
                            prefixIcon: Icon(Icons.search)),
                      ),
                    ),
                  ],
                );
              } else {
                return Container();
              }
            },
          )
        : BlocBuilder<ShowBloc, ShowState>(
            builder: (context, state) {
              if (state is ShowLoadedState) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.92,
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(15)),
                      child: TextField(
                        onTap: () {
                          FocusScope.of(context).requestFocus(FocusNode());
                          showSearch(
                              context: context,
                              delegate: ItemSearch(state.shows, isMovie));
                        },
                        decoration: InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.all(14),
                            border: InputBorder.none,
                            hintText: 'Search',
                            prefixIcon: Icon(Icons.search)),
                      ),
                    ),
                  ],
                );
              } else {
                return Container();
              }
            },
          );
  }
}

class ItemSearch extends SearchDelegate<dynamic> {
  final List<dynamic> items;
  final bool isMovie;
  ItemSearch(this.items, this.isMovie);

  List<Widget> buildActions(BuildContext context) => [
        IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            if (query.isEmpty)
              close(context, null);
            else
              query = "";
          },
        )
      ];

  @override
  Widget buildLeading(BuildContext context) => IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () => close(context, null),
      );

  @override
  Widget buildResults(BuildContext context) => Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(query),
        ],
      ));

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = isMovie
        ? query.isEmpty
            ? items
            : items.where((item) {
                final itemTitleLower = item['title'].toString().toLowerCase();
                final queryLower = query.toLowerCase();
                return itemTitleLower.startsWith(queryLower);
              }).toList()
        : query.isEmpty
            ? items
            : items.where((item) {
                final itemTitleLower = item['name'].toString().toLowerCase();
                final queryLower = query.toLowerCase();
                return itemTitleLower.startsWith(queryLower);
              }).toList();

    return buildSuggestionsSuccess(suggestions);
  }

  Widget buildSuggestionsSuccess(List<dynamic> suggestions) => ListView.builder(
      itemCount: suggestions.length,
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        final suggestion = suggestions[index];
        const imgBase = "https://image.tmdb.org/t/p/w500";
        goToItemDetails(int id, bool isMovie) {
          Get.to(() => MovieDetails(id: id, isMovie: isMovie));
        }

        return InkWell(
          onTap: () {
            goToItemDetails(suggestion['id'], isMovie);
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
                                    '$imgBase${suggestion['poster_path']}'))),
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
                                ? '${suggestion['title']}'
                                : '${suggestion['name']}',
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
                      onPressed: () {
                        goToItemDetails(suggestion['id'], isMovie);
                      },
                      icon: Icon(Icons.chevron_right))
                ],
              )),
        );
      });
}
