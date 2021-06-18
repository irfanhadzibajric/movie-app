import 'package:flutter/material.dart';

class TabButton extends StatelessWidget {
  final String text;
  final int selectedPage;
  final int pageNumber;
  final onPressed;
  TabButton(
      {required this.text,
      required this.selectedPage,
      required this.pageNumber,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: AnimatedContainer(
        width: MediaQuery.of(context).size.width * 0.46,
        duration: Duration(milliseconds: 1000),
        curve: Curves.fastLinearToSlowEaseIn,
        height: 40,
        decoration: BoxDecoration(
            color:
                selectedPage == pageNumber ? Colors.blue : Colors.transparent,
            borderRadius: BorderRadius.circular(4.0),
            border: Border.all(color: Colors.blue)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(
                color: selectedPage == pageNumber ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
