import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/constants/api_key.dart';
import 'package:movies_app/services/movies_service.dart';

class TrendingMovies extends StatelessWidget {
  const TrendingMovies({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: MoviesService().getTrendingMovies(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(
              child: Text("Error: Please check your Internet connection"));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text("No movies found"));
        }
        final moviesList = snapshot.data as List<dynamic>;
        moviesList.shuffle();
        return Column(
          children: [
            CarouselSlider(
              items: moviesList.map(
                (movie) {
                  return Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    width: double.infinity,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                      child: Image.network(
                        "$imagePath${movie.poster}",
                        fit: BoxFit.fill,
                      ),
                    ),
                  );
                },
              ).toList(),
              options: CarouselOptions(
                height: 250,
                autoPlay: true,
                viewportFraction: 0.70,
                pageSnapping: true,
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                autoPlayAnimationDuration: const Duration(seconds: 1),
              ),
            ),
          ],
        );
      },
    );
  }
}
