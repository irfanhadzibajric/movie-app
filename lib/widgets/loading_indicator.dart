import 'package:flutter/material.dart';

class LoadingIndicatior extends StatelessWidget {
  const LoadingIndicatior({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
