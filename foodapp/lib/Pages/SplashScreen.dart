import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "images/Splash.jpeg",
              height: 300,
            ),
            Container(
                margin: EdgeInsets.only(top: 50),
                child: Text(
                  "Buy Fresh Food",
                  style: TextStyle(color: Color(0xff00a368), fontSize: 30),
                ))
          ],
        ),
      ),
    );
  }
}
