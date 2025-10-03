import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";

import "package:nasa_apod/presentation/themes/extension.dart";

class CustomIconButton extends StatefulWidget {
  final void Function()? onPressed;
  final IconData icon;

  const CustomIconButton({
    super.key,
    required this.onPressed,
    required this.icon,
  });

  @override
  State<CustomIconButton> createState() => _CustomIconButtonState();
}

class _CustomIconButtonState extends State<CustomIconButton> {
  @override
  Widget build(BuildContext context) {
    CustomTheme theme = CustomTheme.of(context);
    return FilledButton(
      onPressed: widget.onPressed,
      style: theme.styles.iconButtonBorder,
      child: Icon(widget.icon, color: theme.palette.icon, size: 24.r),
    );
  }
}
