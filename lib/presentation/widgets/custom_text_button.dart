import "package:flutter/material.dart";

import "package:nasa_apod/presentation/themes/extension.dart";

class CustomTextButton extends StatefulWidget {
  final Function()? onPressed;
  final String text;

  const CustomTextButton({
    super.key,
    required this.onPressed,
    required this.text,
  });

  @override
  State<CustomTextButton> createState() => _CustomTextButtonState();
}

class _CustomTextButtonState extends State<CustomTextButton> {
  @override
  Widget build(BuildContext context) {
    CustomTheme theme = CustomTheme.of(context);
    return FilledButton(
      onPressed: widget.onPressed,
      style: theme.styles.textButtonBorder,
      child: Text(widget.text, textAlign: TextAlign.center, style: theme.styles.buttonTextStyle),
    );
  }
}
