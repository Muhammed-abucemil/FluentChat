import 'package:chatter/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void main() => runApp(const StarScreen());

class StarScreen extends StatefulWidget {
  const StarScreen({Key? key}) : super(key: key);

  @override
  State<StarScreen> createState() => _MyAppState();
}

class _MyAppState extends State<StarScreen> with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this);
    Future(() {
      navigateToMain();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
            alignment: Alignment.center,
            child: Lottie.asset(
              'assets/startScreen.json',
              controller: _controller,
              onLoaded: (composition) {
                // Configure the AnimationController with the duration of the
                // Lottie file and start the animation.
                _controller
                  ..duration = composition.duration
                  ..forward();
              },
            )),
      ),
    );
  }

  void navigateToMain() {
    Future.delayed(const Duration(milliseconds: 6500), (() {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const SplashScreen(),
      ));
    }));
  }
}
