import 'package:flutter/material.dart';
import 'package:shopping_list/app/home_screen.dart';

import 'app/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Innovation',
      theme: appTheme,
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(title: 'Shopping List'),
    );
  }
}

