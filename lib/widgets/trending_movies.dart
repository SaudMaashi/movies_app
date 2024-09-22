import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/constants/constants.dart';
import 'package:movies_app/screens/all_movies.dart';
import 'package:movies_app/screens/details_screen.dart';
import 'package:movies_app/services/movies_service.dart';
import 'package:movies_app/widgets/custom_loading_indicator.dart';

class TrendingMovies extends StatelessWidget {
  const TrendingMovies({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const SizedBox(width: 18),
            const Text(
              "Trending Movies",
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(width: 100),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const AllMovies();
                    },
                  ),
                );
              },
              child: const Text(
                "View more",
              ),
            ),
          ],
        ),
        const SizedBox(height: 25),
        FutureBuilder(
          future: MoviesService().getTrendingMovies(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CustomLoadingIndicator(itemCount: 3);
            } else if (snapshot.hasError) {
              return const Center(
                  child: Text("Please check your Internet connection"));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text("No movies found"));
            }
            final moviesList = snapshot.data as List<dynamic>;
            moviesList.shuffle();
            return SizedBox(
              height: 350,
              width: double.infinity,
              child: ListView.builder(
                physics: const ScrollPhysics(),
                itemCount: 1,
                itemBuilder: (context, index) {
                  return CarouselSlider(
                    items: moviesList.map(
                      (movie) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return DetailsScreen(movie: movie);
                                },
                              ),
                            );
                          },
                          child: Stack(
                            children: [
                              Positioned(
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(12)),
                                  child: CachedNetworkImage(
                                    imageUrl: "$imagePath${movie.poster}",
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 20,
                                right: 20,
                                child: Column(
                                  children: [
                                    const Icon(Icons.star, color: Colors.amber),
                                    Text(movie.vote.toStringAsFixed(2)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ).toList(),
                    options: CarouselOptions(
                      height: 350,
                      autoPlay: true,
                      viewportFraction: 0.55,
                      pageSnapping: true,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      autoPlayAnimationDuration: const Duration(seconds: 1),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
