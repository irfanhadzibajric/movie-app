import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/movie_bloc/movie_bloc.dart';
import 'package:movie_app/data/models/movie/movie_result.dart';
import 'package:movie_app/widgets/search_box.dart';

class MovieScreen extends StatelessWidget {
  const MovieScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocBuilder<MovieBloc, MovieState>(builder: (context, state) {
        if (state is MovieInitial || state is MovieLoadingState) {
          return Center(child: CircularProgressIndicator());
        } else if (state is MovieLoadedState) {
          return movieCards(state.movies);
        } else {
          return Text('Error');
        }
      }),
    );
  }
}

// TODO: change dynamic to movieresult
movieCards(
  dynamic movies,
) {
  return Column(
    children: [
      SearchBox(),
      Container(
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            padding: const EdgeInsets.all(0),
            itemCount: movies.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                  height: 70.0,
                  color: Colors.transparent,
                  child: Card(
                    elevation: 0.3,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Containter for image
                        Row(
                          children: [
                            Container(),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${index + 1} ${movies['results'][index]['title']}',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text('Description')
                              ],
                            ),
                          ],
                        ),

                        IconButton(
                            onPressed: () {}, icon: Icon(Icons.chevron_right))
                      ],
                    ),
                  ));
            }),
      ),
    ],
  );
}
