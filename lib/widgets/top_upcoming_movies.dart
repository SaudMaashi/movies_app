import 'package:flutter/material.dart';
import 'package:movies_app/constants/constants.dart';
import 'package:movies_app/screens/details_screen.dart';

class TopAndUpcomingMovies extends StatelessWidget {
  final Future<List<dynamic>>? future;
  final String text;
  const TopAndUpcomingMovies({
    super.key,
    required this.future,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            const SizedBox(width: 12),
            Text(
              text,
              style: const TextStyle(fontSize: 24),
            ),
          ],
        ),
        const SizedBox(height: 30),
        FutureBuilder(
          future: future,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                  child: CircularProgressIndicator(color: Colors.white));
            } else if (snapshot.hasError) {
              return const Center(
                  child: Text("Please check your Internet connection"));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text("No movies found"));
            }
            final moviesList = snapshot.data as List<dynamic>;
            moviesList.shuffle();
            return SizedBox(
              height: 250,
              width: 500,
              child: ListView.builder(
                itemCount: moviesList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: Stack(
                      children: [
                        const SizedBox(width: 10),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return DetailsScreen(
                                      movie: moviesList[index]);
                                },
                              ),
                            );
                          },
                          child: SizedBox(
                            child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(12)),
                              child: Image.network(
                                "$imagePath${moviesList[index].poster}",
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Positioned(
                          right: 15,
                          top: 15,
                          child: Column(
                            children: [
                              const Icon(Icons.star, color: Colors.amber),
                              Text(moviesList[index].vote.toStringAsFixed(2) ==
                                      "0.00"
                                  ? "Not rated yet"
                                  : moviesList[index].vote.toStringAsFixed(2)),
                            ],
                          ),
                        ),
                      ],
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
