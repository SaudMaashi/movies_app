import 'package:flutter/material.dart';
import 'package:movies_app/screens/home_screen.dart';

void main() {
  runApp(const MoviesApp());
}

class MoviesApp extends StatelessWidget {
  const MoviesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
      theme: ThemeData.dark(useMaterial3: false),
    );
  }
}
