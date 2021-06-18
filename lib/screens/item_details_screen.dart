import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:movie_app/bloc/movie_bloc/movie_bloc.dart';
import 'package:movie_app/bloc/show_bloc/show_bloc.dart';
import 'package:movie_app/data/repository/resporitory.dart';
import 'package:movie_app/screens/error_screen.dart';
import 'package:movie_app/widgets/item_info.dart';
import 'package:movie_app/widgets/loading_indicator.dart';

class MovieDetails extends StatelessWidget {
  final int id;
  final bool isMovie;
  MovieDetails({required this.id, required this.isMovie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        centerTitle: true,
        title: Text(
          'An app',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: isMovie
          ? BlocProvider(
              create: (context) => MovieBloc(repository: Repository())
                ..add(FetchSingleMovieDataEvent(movieId: id)),
              child:
                  BlocBuilder<MovieBloc, MovieState>(builder: (context, state) {
                if (state is SingleMovieLoadingState) {
                  return LoadingIndicatior();
                } else if (state is SingleMovieLoadedState) {
                  return ItemInfo(isMovie: true, item: state.movie);
                } else if (state is SingleMovieErrorState) {
                  return ErrorScreen(
                    message: state.message,
                  );
                } else {
                  return Text('');
                }
              }),
            )
          : BlocProvider(
              create: (context) => ShowBloc(repository: Repository())
                ..add(FetchSingleShowDataEvent(showId: id)),
              child:
                  BlocBuilder<ShowBloc, ShowState>(builder: (context, state) {
                if (state is SingleShowLoadingState) {
                  return LoadingIndicatior();
                } else if (state is SingleShowLoadedState) {
                  return ItemInfo(isMovie: false, item: state.show);
                } else if (state is SingleShowErrorState) {
                  return ErrorScreen(
                    message: state.message,
                  );
                } else {
                  return Text('');
                }
              }),
            ),
    );
  }
}
