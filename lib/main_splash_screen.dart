

import 'package:flutter/material.dart';

import 'package:splash_screen_view/SplashScreenView.dart' show SplashScreenView, TextType;

class MainSplashScreen extends StatefulWidget {
  const MainSplashScreen({Key? key}) : super(key: key);

  @override
  _MainSplashScreenState createState() => _MainSplashScreenState();
}

class _MainSplashScreenState extends State<MainSplashScreen> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: SplashScreenView(
            navigateRoute: MainSplashScreen(),
            duration: 5000,
            imageSize: 100,
            imageSrc: "images/s2.jpg",
            text: "Splash Screen",
            textType: TextType.ColorizeAnimationText,
            textStyle: TextStyle(
              fontSize: 40.0,
            ),
            colors: [
              Colors.purple,
              Colors.blue,
              Colors.yellow,
              Colors.red,
            ],
            backgroundColor: Colors.blueGrey,
          ),
        ),

    );
  }
}
