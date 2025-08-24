import "package:flutter/material.dart";

abstract class Palette {
  abstract Color background;
  abstract Color bloc;
  abstract Color icon;
  abstract Color shadow;
  abstract Color text;
  Color transparent = Colors.transparent;
}

class DarkPalette extends Palette {
  @override
  Color background = Color(0xFF000000);

  @override
  Color bloc = Color(0xE6111111);

  @override
  Color icon = Color(0xFFFFFFFF);

  @override
  Color shadow = Color(0x1AFFFFFF);

  @override
  Color text = Color(0xFFFFFFFF);
}
