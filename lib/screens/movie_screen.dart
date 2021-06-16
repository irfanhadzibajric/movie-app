import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/movie_bloc/movie_bloc.dart';
import 'package:movie_app/data/models/movie/movie_result.dart';
import 'package:movie_app/widgets/navigation_bar.dart';
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
          return movieCards(state.movies, context);
        } else {
          return Text('Error');
        }
      }),
    );
  }
}

// TODO: change dynamic to movieresult
movieCards(List movies, BuildContext context) {
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
                                            '$imgBase${movies[index]['poster_path']}'))),
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
                                    '${movies[index]['title']}',
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
                              onPressed: () {}, icon: Icon(Icons.chevron_right))
                        ],
                      ));
                }),
          ),
        ),
      ],
    ),
  );
}
