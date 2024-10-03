import 'package:flutter/material.dart';
import 'dart:math' as math;

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Animated gradient background
          AnimatedBuilder(
            animation: _controller,
            builder: (_, __) {
              return Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      HSLColor.fromAHSL(1, _controller.value * 360, 0.8, 0.9)
                          .toColor(),
                      HSLColor.fromAHSL(
                              1, (_controller.value * 360 + 60) % 360, 0.8, 0.9)
                          .toColor(),
                    ],
                  ),
                ),
              );
            },
          ),
          // Decorative shapes
          Positioned(
            top: -50,
            left: -50,
            child: _buildRotatingShape(Colors.white.withOpacity(0.1), 200),
          ),
          Positioned(
            bottom: -30,
            right: -30,
            child: _buildRotatingShape(Colors.white.withOpacity(0.1), 150),
          ),
          // Main content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Animated logo
                TweenAnimationBuilder(
                  tween: Tween<double>(begin: 0, end: 1),
                  duration: const Duration(seconds: 1),
                  builder: (context, double value, child) {
                    return Transform.scale(
                      scale: value,
                      child: child,
                    );
                  },
                  child: Image.asset(
                    "images/Splash.png",
                    height: 300,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 50),
                  child: const Text(
                    "Buy Fresh Foods",
                    style: TextStyle(
                      color: Color.fromARGB(255, 73, 227, 163),
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          blurRadius: 10.0,
                          color: Colors.black26,
                          offset: Offset(5.0, 5.0),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                _buildAnimatedButton(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRotatingShape(Color color, double size) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, child) {
        return Transform.rotate(
          angle: _controller.value * 2 * math.pi,
          child: child,
        );
      },
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }

  Widget _buildAnimatedButton(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0, end: 1),
      duration: const Duration(milliseconds: 500),
      builder: (context, double value, child) {
        return Transform.scale(
          scale: 0.8 + (value * 0.2),
          child: child,
        );
      },
      child: InkWell(
        onTap: () {
          Navigator.pushReplacementNamed(context, "homePage");
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Color(0xff00a368),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: const Text(
            "Get Started",
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
