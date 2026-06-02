import 'dart:math' as math;
import 'package:flutter/material.dart';

class AnimatedBallScreen extends StatefulWidget {
  const AnimatedBallScreen({super.key});

  @override
  State<AnimatedBallScreen> createState() => _AnimatedBallScreenState();
}

class _AnimatedBallScreenState extends State<AnimatedBallScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  late final Animation<double> _bounceAnimation;

  late final Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
    );

    _bounceAnimation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween(
          begin: 0.0,
          end: 1.0,
        ).chain(CurveTween(curve: Curves.easeOutQuart)),
        weight: 22,
      ),
      TweenSequenceItem(
        tween: Tween(
          begin: 1.0,
          end: 0.0,
        ).chain(CurveTween(curve: Curves.easeIn)),
        weight: 22,
      ),

      TweenSequenceItem(
        tween: Tween(
          begin: 0.0,
          end: 0.5,
        ).chain(CurveTween(curve: Curves.easeOut)),
        weight: 14,
      ),
      TweenSequenceItem(
        tween: Tween(
          begin: 0.5,
          end: 0.0,
        ).chain(CurveTween(curve: Curves.easeIn)),
        weight: 14,
      ),

      TweenSequenceItem(
        tween: Tween(
          begin: 0.0,
          end: 0.2,
        ).chain(CurveTween(curve: Curves.easeOut)),
        weight: 8,
      ),
      TweenSequenceItem(
        tween: Tween(
          begin: 0.2,
          end: 0.0,
        ).chain(CurveTween(curve: Curves.easeIn)),
        weight: 8,
      ),

      TweenSequenceItem(
        tween: Tween(
          begin: 0.0,
          end: 0.06,
        ).chain(CurveTween(curve: Curves.easeOut)),
        weight: 4,
      ),
      TweenSequenceItem(
        tween: Tween(
          begin: 0.06,
          end: 0.0,
        ).chain(CurveTween(curve: Curves.easeIn)),
        weight: 4,
      ),

      TweenSequenceItem(
        tween: ConstantTween(0.0),
        weight: 20,
      ),
    ]).animate(_controller);

    const full = 2 * math.pi;
    _rotationAnimation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween(
          begin: 0.0,
          end: full * 0.95,
        ).chain(CurveTween(curve: Curves.linear)),
        weight: 44,
      ),

      TweenSequenceItem(
        tween: Tween(
          begin: full * 0.95,
          end: full * 1.40,
        ).chain(CurveTween(curve: Curves.linear)),
        weight: 28,
      ),

      TweenSequenceItem(
        tween: Tween(
          begin: full * 1.40,
          end: full * 1.58,
        ).chain(CurveTween(curve: Curves.linear)),
        weight: 16,
      ),

      TweenSequenceItem(
        tween: Tween(
          begin: full * 1.58,
          end: full * 1.64,
        ).chain(CurveTween(curve: Curves.linear)),
        weight: 8,
      ),

      TweenSequenceItem(
        tween: ConstantTween(full * 1.64),
        weight: 20,
      ),
    ]).animate(_controller);

    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Animated Ball',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF4A9EFF),
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final jumpHeight = constraints.maxHeight * 0.65;

          return Stack(
            children: [
              Container(color: const Color(0xFFA8D8FF)),

              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 120,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xFF7BC47F), Color(0xFF3E8B43)],
                    ),
                  ),
                ),
              ),

              AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  const groundOffset = 110.0;
                  final bottom =
                      groundOffset + (_bounceAnimation.value * jumpHeight);
                  return Positioned(
                    bottom: bottom,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Transform.rotate(
                        angle: _rotationAnimation.value,
                        child: child,
                      ),
                    ),
                  );
                },

                child: Image.asset(
                  'assets/images/ball.png',
                  width: 70,
                  height: 70,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
