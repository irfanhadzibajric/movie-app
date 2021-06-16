import 'package:flutter/material.dart';

class NavigationBar extends StatelessWidget {
  const NavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              width: MediaQuery.of(context).size.width * 0.46,
              child: OutlinedButton(
                onPressed: () {},
                child: Text('Movies'),
                style: ButtonStyle(),
              )),
          Container(
              width: MediaQuery.of(context).size.width * 0.46,
              child: OutlinedButton(onPressed: () {}, child: Text('TV shows'))),
        ],
      ),
    );
  }
}
