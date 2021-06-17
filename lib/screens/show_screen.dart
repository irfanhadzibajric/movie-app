import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/show_bloc/show_bloc.dart';
import 'package:movie_app/widgets/item_list.dart';
import 'package:movie_app/widgets/loading_indicator.dart';

class ShowScreen extends StatelessWidget {
  const ShowScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShowBloc, ShowState>(builder: (context, state) {
      if (state is ShowInitial || state is ShowLoadingState) {
        return LoadingIndicatior();
      } else if (state is ShowLoadedState) {
        return CardList(state.shows, false);
      } else {
        return Text('Error');
      }
    });
  }
}
