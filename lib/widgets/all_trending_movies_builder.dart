import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/constants/constants.dart';
import 'package:movies_app/services/movies_service.dart';
import 'package:movies_app/widgets/custom_loading_indicator.dart';

// ignore: must_be_immutable
class AllTrendingMoviesBuilder extends StatelessWidget {
  String searchText;
  AllTrendingMoviesBuilder({
    super.key,
    required this.searchText,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: MoviesService().stream(searchText),
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
              return CachedNetworkImage(
                imageUrl: "$imagePath${moviesList[index].poster}",
              );
            },
          ),
        );
      },
    );
  }
}
