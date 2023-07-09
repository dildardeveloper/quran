import 'package:admin/splash_firebase/firebasesplashservice.dart';
import 'package:flutter/material.dart';

class splashscreen extends StatefulWidget {
  const splashscreen({super.key});

  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  firebasesplashservice firebasesplashScreen = firebasesplashservice();
  @override
  void initState() {
    super.initState();
    firebasesplashScreen.islogin(context);
    // splashscreen.navigationPage(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff3F48CC),
      body: Container(
        child: Center(
            child: Image.asset(
          "assets/splg.png",
          width: 170,
          height: 160,
        )),
      ),
    );
  }
}
