import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/constants/api_key.dart';
import 'package:movies_app/services/movies_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void shuffleList() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(50),
        child: FutureBuilder(
            future: MoviesService().getTrendingMovies(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return const Center(
                    child:
                        Text("Error: Please check your Internet connection"));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text("No movies found"));
              }
              final moviesList = snapshot.data as List<dynamic>;
              return Column(
                children: [
                  CarouselSlider(
                    items: moviesList.map((movie) {
                      return SizedBox(
                          width: double.infinity,
                          child: Image.network(
                            "$imagePath${movie.poster}",
                            fit: BoxFit.fill,
                          ));
                    }).toList(),
                    options: CarouselOptions(
                      height: 300,
                      autoPlay: true,
                      viewportFraction: 0.55,
                      pageSnapping: true,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      autoPlayAnimationDuration: const Duration(seconds: 1),
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }
}
