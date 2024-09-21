import 'package:flutter/material.dart';
import 'package:movies_app/services/movies_service.dart';
import 'package:movies_app/widgets/top_upcoming_movies.dart';
import 'package:movies_app/widgets/trending_movies.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 50),
              const TrendingMovies(),
              const SizedBox(height: 35),
              TopAndUpcomingMovies(
                  future: MoviesService().getTopRatedMovies(),
                  text: "Top Rated Movies"),
              const SizedBox(height: 35),
              TopAndUpcomingMovies(
                  future: MoviesService().getUpcomingMovies(),
                  text: "Upcoming Movies"),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
