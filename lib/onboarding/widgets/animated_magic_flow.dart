import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AnimatedMagicFlow extends StatefulWidget {
  const AnimatedMagicFlow({super.key});

  @override
  State<AnimatedMagicFlow> createState() => _AnimatedMagicFlowState();
}

class _AnimatedMagicFlowState extends State<AnimatedMagicFlow>
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
      'assets/lottie/magic_flow.json',
      controller: _controller,
      onLoaded: (composition) {
        _controller
          ..duration = composition.duration
          ..repeat();
        // Parallax / Speed adjustment: Parallax Lottie (0.8x controller speed)
        _controller.duration = composition.duration * 1.25; // 0.8x speed
        _controller.forward();
      },
    );
  }
}
