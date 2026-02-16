import 'package:flutter/material.dart';

class SelenicAnimatedDefaultTextStyle extends StatefulWidget {
  final TextStyle textStyle;
  final Duration duration;
  final Curve curve;
  final Widget child;

  /// Creates a utility widget for animating text style.
  const SelenicAnimatedDefaultTextStyle({
    super.key,
    required this.textStyle,
    required this.duration,
    required this.curve,
    required this.child,
  });

  @override
  _SelenicAnimatedDefaultTextStyleState createState() =>
      _SelenicAnimatedDefaultTextStyleState();
}

class _SelenicAnimatedDefaultTextStyleState
    extends State<SelenicAnimatedDefaultTextStyle>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _textStyleAnimation;
  late TextStyleTween _textStyle;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );
    _textStyleAnimation = CurvedAnimation(
      parent: _controller,
      curve: widget.curve,
    );
    _textStyle = TextStyleTween(
      begin: widget.textStyle,
      end: widget.textStyle,
    );
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  void didUpdateWidget(SelenicAnimatedDefaultTextStyle oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.textStyle != oldWidget.textStyle) {
      _textStyle = TextStyleTween(
        begin: oldWidget.textStyle,
        end: widget.textStyle,
      );
      _controller
        ..value = 0.0
        ..forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _textStyleAnimation,
      builder: (context, child) {
        return DefaultTextStyle(
          style: _textStyle.evaluate(_textStyleAnimation),
          child: child!,
        );
      },
      child: widget.child,
    );
  }
}
