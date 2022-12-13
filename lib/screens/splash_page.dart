import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation sizeAnimation;
  late Animation borderAnimation;
  late Animation opacityAnimation;
  late Animation opacityReverseAnimation;

  @override
  void initState() {
    super.initState();
    const duration = Duration(seconds: 3);

    _animationController = AnimationController(vsync: this, duration: duration);

    sizeAnimation = Tween<double>(begin: 70, end: 1000).animate(CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.5, 1, curve: Curves.bounceIn)));

    borderAnimation = Tween<double>(begin: 12, end: 0).animate(CurvedAnimation(
        parent: _animationController, curve: const Interval(0.7, 1)));

    opacityAnimation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: _animationController, curve: const Interval(0, .4)));

    opacityReverseAnimation = Tween<double>(begin: 1, end: 0).animate(
        CurvedAnimation(
            parent: _animationController, curve: const Interval(.5, .65)));

    _animationController.forward();

    _animationController.addListener(() {
      setState(() {
        if (_animationController.isCompleted && mounted) {
          Navigator.of(context).pushReplacementNamed('/home');
        }
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Align(
        alignment: Alignment.center,
        child: Opacity(
          opacity: opacityAnimation.value,
          child: Container(
            height: sizeAnimation.value,
            width: sizeAnimation.value,
            decoration: BoxDecoration(
                color: Colors.yellow,
                borderRadius: BorderRadius.circular(borderAnimation.value)),
            child: Center(
              child: Opacity(
                opacity: opacityReverseAnimation.value,
                child: const Text(
                  "Post-it",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
