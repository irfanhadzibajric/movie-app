import 'package:flutter/material.dart';

import 'package:movie_app/screens/movie_screen.dart';
import 'package:movie_app/screens/show_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Container(
      height: mediaQuery.height,
      // child: MovieScreen(),
      child: ShowScreen(),
    );
  }
}
