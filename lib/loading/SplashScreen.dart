import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:page_transition/page_transition.dart';
import 'package:thebookstore/homepage/HomePage.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Image.asset("assets/BOOKSTORE.png"),
      animationDuration: const Duration(seconds: 3),
        splashIconSize: 600.0,
      pageTransitionType: PageTransitionType.fade,
      nextScreen: HomePage(),

    );
  }
}
