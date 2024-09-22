import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/constants/constants.dart';
import 'package:movies_app/models/movies_model.dart';

class DetailsScreen extends StatelessWidget {
  final MoviesModel movie;
  @override
  const DetailsScreen({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 600,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      top: 0,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(50),
                          bottomLeft: Radius.circular(50),
                        ),
                        child: CachedNetworkImage(
                          imageUrl: "$imagePath${movie.poster}",
                        ),
                      ),
                    ),
                    Positioned(
                      left: 15,
                      top: 15,
                      height: 50,
                      width: 50,
                      child: Container(
                        decoration: BoxDecoration(
                            color: const Color(0xFF151218),
                            borderRadius: BorderRadius.circular(24)),
                        child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.arrow_back)),
                      ),
                    ),
                  ],
                ),
              ),
              const Text(
                "Name",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 32),
              ),
              const SizedBox(height: 25),
              Text(
                textAlign: TextAlign.center,
                movie.title,
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 25),
              const Text(
                "Overview",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 32),
              ),
              Padding(
                padding: const EdgeInsets.all(25),
                child: Text(
                  movie.overview,
                  style: const TextStyle(fontSize: 18),
                ),
              ),
              const Text(
                textAlign: TextAlign.center,
                "Release Date",
                style: TextStyle(fontSize: 32),
              ),
              const SizedBox(height: 25),
              Text(
                movie.releaseDate,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }
}
