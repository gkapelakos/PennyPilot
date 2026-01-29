import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AnimatedEagle extends StatefulWidget {
  const AnimatedEagle({super.key});

  @override
  State<AnimatedEagle> createState() => _AnimatedEagleState();
}

class _AnimatedEagleState extends State<AnimatedEagle>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      'assets/lottie/privacy_eagle.json',
      controller: _controller,
      onLoaded: (composition) {
        _controller
          ..duration = composition.duration
          ..repeat();
        // Parallax / Speed adjustment: Parallax Lottie (0.8x controller speed)
        _controller.forward();
        _controller.resync(this);
        _controller.duration = composition.duration * 1.25; // 0.8x speed
      },
    );
  }
}
