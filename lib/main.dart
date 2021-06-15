import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/movie_bloc/movie_bloc.dart';
import 'package:movie_app/data/repositories/movie_repository.dart';
import 'package:movie_app/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
        body: BlocProvider(
          create: (context) =>
              MovieBloc(repository: MovieRepository())..add(FetchDataEvent()),
          child: HomeScreen(),
        ),
      ),
    );
  }
}

// https://api.themoviedb.org/3/movie/550?api_key=7567e45a49ce2c511f9240fec1edb428


// Json_seriazible flutter packages pub run build_runner build --delete-conflicting-outputs