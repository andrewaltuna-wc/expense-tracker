import 'package:expense_tracker/tracker/mixins/double_formatter.dart';
import 'package:flutter/material.dart';

class AnimatedCount extends ImplicitlyAnimatedWidget with DoubleFormatter {
  const AnimatedCount({
    super.key,
    super.duration = const Duration(milliseconds: 600),
    super.curve = Curves.fastOutSlowIn,
    required this.count,
    required this.textStyle,
  });

  final double count;
  final TextStyle textStyle;

  @override
  ImplicitlyAnimatedWidgetState<ImplicitlyAnimatedWidget> createState() {
    return _AnimatedCountState();
  }
}

class _AnimatedCountState extends AnimatedWidgetBaseState<AnimatedCount> {
  Tween<double> _doubleCount = Tween<double>(begin: 0, end: 1);

  @override
  Widget build(BuildContext context) {
    return Text(
      '₱ ${widget.formatDouble(_doubleCount.evaluate(animation))}',
      style: widget.textStyle,
    );
  }

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _doubleCount = visitor(
      _doubleCount,
      widget.count,
      (dynamic value) => Tween<double>(begin: value),
    ) as Tween<double>;
  }
}
