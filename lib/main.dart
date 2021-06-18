import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:movie_app/bloc/movie_bloc/movie_bloc.dart';
import 'package:movie_app/bloc/search_bloc/search_bloc.dart';
import 'package:movie_app/bloc/show_bloc/show_bloc.dart';
import 'package:movie_app/data/repository/resporitory.dart';
import 'package:movie_app/screens/error_screen.dart';
import 'package:movie_app/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'An app',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => MovieBloc(repository: Repository())
                ..add(FetchMovieDataEvent()),
            ),
            BlocProvider(
              create: (context) =>
                  ShowBloc(repository: Repository())..add(FetchShowDataEvent()),
            ),
            BlocProvider(
              create: (context) => SearchBloc(repository: Repository()),
            ),
          ],
          child: HomeScreen(),
        ),
      ),
    );
  }
}

// https://api.themoviedb.org/3/movie/550?api_key=7567e45a49ce2c511f9240fec1edb428


// Json_seriazible flutter packages pub run build_runner build --delete-conflicting-outputs