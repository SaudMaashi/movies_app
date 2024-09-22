import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/constants/constants.dart';
import 'package:movies_app/screens/details_screen.dart';
import 'package:movies_app/widgets/custom_loading_indicator.dart';
import 'package:movies_app/widgets/custom_rating_widget.dart';

class TopAndUpcomingMovies extends StatelessWidget {
  final Stream<List<dynamic>>? stream;
  final String text;
  const TopAndUpcomingMovies({
    super.key,
    required this.stream,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            const SizedBox(width: 18),
            Text(
              text,
              style: const TextStyle(fontSize: 24),
            ),
          ],
        ),
        const SizedBox(height: 30),
        StreamBuilder(
          stream: stream,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CustomLoadingIndicator(itemCount: 3);
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
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return DetailsScreen(movie: moviesList[index]);
                          },
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Stack(
                        children: [
                          const SizedBox(width: 10),
                          SizedBox(
                            child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(12)),
                              child: CachedNetworkImage(
                                imageUrl:
                                    "$imagePath${moviesList[index].poster}",
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          CustomRatingWidget(movie: moviesList[index]),
                        ],
                      ),
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
