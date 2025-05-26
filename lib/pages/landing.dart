import 'package:flutter/material.dart';

class NameTransferAnimation extends StatefulWidget {
  final VoidCallback? onAnimationComplete;

  const NameTransferAnimation({super.key, this.onAnimationComplete});

  @override
  NameTransferAnimationState createState() => NameTransferAnimationState();
}

class NameTransferAnimationState extends State<NameTransferAnimation>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  bool _movedToAppBar = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    // Start initial animation, then after delay, move to app bar
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        _movedToAppBar = true;
      });
      _controller.forward();

      Future.delayed(const Duration(milliseconds: 1000), () {
        if (widget.onAnimationComplete != null) {
          widget.onAnimationComplete!();
        }
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  static const double bigFontSize = 60;
  static const double smallFontSize = 20;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        AnimatedPositioned(
          duration: const Duration(milliseconds: 1000),
          curve: Curves.easeInOut,
          top: _movedToAppBar
              ? 12
              : (MediaQuery.of(context).size.height / 2 - bigFontSize),
          left: _movedToAppBar ? 16 : (screenWidth / 2 - 150),
          child: AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 1000),
            style: TextStyle(
              fontSize: _movedToAppBar ? smallFontSize : bigFontSize,
              fontWeight: FontWeight.bold,
              color: Colors.redAccent,
            ),
            child: const Text('Sai Hrithik Reddy Movva'),
          ),
        ),
      ],
    );
  }
}
