import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/constants/constants.dart';
import 'package:movies_app/screens/details_screen.dart';
import 'package:movies_app/widgets/custom_loading_indicator.dart';

// ignore: must_be_immutable
class AllMoviesBuilder extends StatelessWidget {
  String searchText;
  Stream<List<dynamic>>? stream;
  AllMoviesBuilder({
    super.key,
    required this.searchText,
    required this.stream,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: stream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CustomLoadingIndicator(itemCount: 10);
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text("No movies found"));
        }
        final moviesList = snapshot.data as List<dynamic>;
        return Expanded(
          child: ListView.builder(
            itemCount: moviesList.length,
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
                child: CachedNetworkImage(
                  imageUrl: "$imagePath${moviesList[index].poster}",
                ),
              );
            },
          ),
        );
      },
    );
  }
}
