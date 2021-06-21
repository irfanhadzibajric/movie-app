import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/movie_bloc/movie_bloc.dart';
import 'package:movie_app/bloc/show_bloc/show_bloc.dart';
import 'package:movie_app/widgets/movie_item_list.dart';
import 'package:movie_app/widgets/loading_indicator.dart';
import 'package:movie_app/widgets/search_box.dart';
import 'package:movie_app/widgets/show_item_list.dart';
import 'package:movie_app/widgets/tab_button.dart';

import 'error_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedPage = 0;
  late PageController _pageController;

  void _changePage(int pageNum) {
    setState(() {
      _selectedPage = pageNum;
      _pageController.animateToPage(
        pageNum,
        duration: Duration(milliseconds: 1000),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SearchBox(isMovie: _selectedPage == 0 ? true : false),
          Container(
            padding: EdgeInsets.symmetric(
              vertical: 12.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TabButton(
                  text: "Movies",
                  pageNumber: 0,
                  selectedPage: _selectedPage,
                  onPressed: () {
                    _changePage(0);
                  },
                ),
                TabButton(
                  text: "TV Shows",
                  pageNumber: 1,
                  selectedPage: _selectedPage,
                  onPressed: () {
                    _changePage(1);
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: PageView(
              onPageChanged: (int page) {
                setState(() {
                  _selectedPage = page;
                });
              },
              controller: _pageController,
              children: [
                Container(child: BlocBuilder<MovieBloc, MovieState>(
                    builder: (context, state) {
                  if (state is MovieInitial || state is MovieLoadingState) {
                    return LoadingIndicatior();
                  } else if (state is MovieLoadedState) {
                    return MovieItemList(
                        state.movies, _selectedPage == 0 ? true : false);
                  } else if (state is MovieErrorState) {
                    return ErrorScreen(
                      message: state.message,
                    );
                  } else {
                    return Text('');
                  }
                })),
                Container(
                  child: BlocBuilder<ShowBloc, ShowState>(
                      builder: (context, state) {
                    if (state is ShowInitial || state is ShowLoadingState) {
                      return LoadingIndicatior();
                    } else if (state is ShowLoadedState) {
                      return ShowItemList(
                          state.shows, _selectedPage == 1 ? true : false);
                    } else if (state is ShowErrorState) {
                      return ErrorScreen(
                        message: state.message,
                      );
                    } else {
                      return Text('');
                    }
                  }),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
