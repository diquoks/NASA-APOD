import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";

import "package:nasa_apod/presentation/themes/extension.dart";

class CustomProgressIndicator extends StatefulWidget {
  final double? value;

  const CustomProgressIndicator({super.key, this.value});

  @override
  State<CustomProgressIndicator> createState() =>
      _CustomProgressIndicatorState();
}

class _CustomProgressIndicatorState extends State<CustomProgressIndicator>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 3000),
    vsync: this,
  )..repeat();

  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.linear,
  );

  @override
  dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    CustomTheme theme = CustomTheme.of(context);
    return RotationTransition(
      turns: _animation,
      child: CircularProgressIndicator(
        backgroundColor: theme.palette.shadow,
        value: widget.value,
        color: theme.palette.icon,
        strokeWidth: 6.r,
      ),
    );
  }
}
