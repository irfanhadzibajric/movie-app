import 'package:flutter/material.dart';
import 'package:movie_app/screens/movie_screen.dart';

import 'package:movie_app/screens/show_screen.dart';
import 'package:movie_app/widgets/search_box.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool movieActive = true;
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Container(
      height: mediaQuery.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SearchBox(),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    width: MediaQuery.of(context).size.width * 0.46,
                    child: OutlinedButton(
                      onPressed: () {
                        setState(() {
                          this.movieActive = true;
                        });
                      },
                      child: Text(
                        'Movies',
                        style: TextStyle(
                            color:
                                this.movieActive ? Colors.white : Colors.blue),
                      ),
                      style: OutlinedButton.styleFrom(
                        backgroundColor:
                            this.movieActive ? Colors.blue : Colors.transparent,
                        side: BorderSide(
                          width: 1.0,
                          color: Colors.blue,
                          style: BorderStyle.solid,
                        ),
                      ),
                    )),
                Container(
                    width: MediaQuery.of(context).size.width * 0.46,
                    child: OutlinedButton(
                      onPressed: () {
                        setState(() {
                          this.movieActive = false;
                        });
                      },
                      child: Text(
                        'TV shows',
                        style: TextStyle(
                            color:
                                !this.movieActive ? Colors.white : Colors.blue),
                      ),
                      style: OutlinedButton.styleFrom(
                        backgroundColor: !this.movieActive
                            ? Colors.blue
                            : Colors.transparent,
                        side: BorderSide(
                          width: 1.0,
                          color: Colors.blue,
                          style: BorderStyle.solid,
                        ),
                      ),
                    )),
              ],
            ),
          ),
          this.movieActive ? MovieScreen() : ShowScreen(),
        ],
      ),
    );
  }
}
