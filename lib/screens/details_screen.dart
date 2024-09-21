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
                      child: Image.network(
                        "$imagePath${movie.poster}",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.white, width: 0.7),
                              color: const Color(0xFF303030),
                              borderRadius: BorderRadius.circular(24)),
                          child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(Icons.arrow_back)),
                        )),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),
            const Text(
              "Overview",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 32),
            ),
            Padding(
                padding: const EdgeInsets.all(24),
                child: Text(
                  movie.overview,
                  style: const TextStyle(fontSize: 18),
                )),
          ],
        ),
      )),
    );
  }
}
