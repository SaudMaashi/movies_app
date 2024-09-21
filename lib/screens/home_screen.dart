import 'package:flutter/material.dart';
import 'package:movies_app/widgets/trending_movies.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text("Welcome"),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(vertical: 25),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TrendingMovies(),
            ],
          ),
        ),
      ),
    );
  }
}
