import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0),
      child: TextField(
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[300],
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue, width: 1),
              borderRadius: BorderRadius.circular(10.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 0.0),
              borderRadius: BorderRadius.circular(10.0),
            ),
            hintText: 'Search',
            prefixIcon: Icon(Icons.search)),
      ),
    );
  }
}
