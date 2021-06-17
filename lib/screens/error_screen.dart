import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/screens/home_screen.dart';

class ErrorScreen extends StatelessWidget {
  final String? message;
  const ErrorScreen({Key? key, this.message}) : super(key: key);

  goToHomeScreen() {
    Get.to(HomeScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Something went wrong.',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.red, fontSize: 24, fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(primary: Colors.green),
            onPressed: () {
              goToHomeScreen();
            },
            child: Text('Retry'),
          ),
          SizedBox(
            height: 10,
          ),
          message != null || message != ""
              ? Text(
                  'Error: $message',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                  ),
                )
              : Text('')
        ],
      ),
    );
  }
}
