import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.92,
          decoration: BoxDecoration(
              color: Colors.grey[300], borderRadius: BorderRadius.circular(15)),
          child: TextField(
            decoration: InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.all(14),
                border: InputBorder.none,
                hintText: 'Search',
                prefixIcon: Icon(Icons.search)),
          ),
        ),
      ],
    );
  }
}
