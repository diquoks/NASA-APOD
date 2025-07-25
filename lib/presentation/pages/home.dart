import 'package:flutter/material.dart';

import 'package:nasa_apod/presentation/themes/extension.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    CustomTheme theme = CustomTheme.of(context);
    return Scaffold(backgroundColor: theme.palette.background, resizeToAvoidBottomInset: false, body: Column());
  }
}
