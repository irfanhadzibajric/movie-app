import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/movie_bloc/movie_bloc.dart';
import 'package:movie_app/widgets/item_list.dart';
import 'package:movie_app/widgets/loading_indicator.dart';

class MovieScreen extends StatelessWidget {
  const MovieScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc, MovieState>(builder: (context, state) {
      if (state is MovieInitial || state is MovieLoadingState) {
        return LoadingIndicatior();
      } else if (state is MovieLoadedState) {
        return CardList(state.movies, true);
      } else {
        return Text('Error');
      }
    });
  }
}
