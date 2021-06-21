import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/movie_bloc/movie_bloc.dart';
import 'package:movie_app/bloc/search_bloc/search_bloc.dart';
import 'package:movie_app/bloc/show_bloc/show_bloc.dart';
import 'package:movie_app/screens/error_screen.dart';
import 'package:movie_app/widgets/movie/movie_item_list.dart';
import 'package:movie_app/widgets/show/show_item_list.dart';

class SearchBox extends StatelessWidget {
  final bool isMovie;
  SearchBox({required this.isMovie});
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
                              delegate: ItemSearch(state.movies, isMovie,
                                  BlocProvider.of<SearchBloc>(context)));
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
                              delegate: ItemSearch(state.shows, isMovie,
                                  BlocProvider.of<SearchBloc>(context)));
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
  var items;
  final bool isMovie;
  SearchBloc searchBloc;
  ItemSearch(this.items, this.isMovie, this.searchBloc);

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
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    isMovie
        ? searchBloc.add(FetchSearchMovieEvent(query: query))
        : searchBloc.add(FetchSearchShowEvent(query: query));

    return isMovie
        ? query.length > 3
            ? BlocBuilder(
                bloc: searchBloc,
                builder: (BuildContext context, SearchState state) {
                  if (state is SearchMovieErrorState) {
                    return ErrorScreen(message: state.message);
                  } else if (state is SearchMovieLoadedState) {
                    return MovieItemList(state.movies);
                  } else {
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          LinearProgressIndicator(),
                          MovieItemList(items),
                        ],
                      ),
                    );
                  }
                })
            : MovieItemList(items)
        : query.length > 3
            ? BlocBuilder(
                bloc: searchBloc,
                builder: (BuildContext context, SearchState state) {
                  if (state is SearchShowErrorState) {
                    return ErrorScreen(message: state.message);
                  } else if (state is SearchShowLoadedState) {
                    return ShowItemList(state.shows);
                  } else {
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          LinearProgressIndicator(),
                          ShowItemList(items),
                        ],
                      ),
                    );
                  }
                })
            : ShowItemList(items);
  }
}
