import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/constants/constants.dart';
import 'package:movies_app/models/movies_model.dart';

class CustomRatingWidget extends StatelessWidget {
  final MoviesModel movie;
  const CustomRatingWidget({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            child: CachedNetworkImage(
              imageUrl: "$imagePath${movie.poster}",
            ),
          ),
        ),
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              color: const Color(0xFF151218),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.white)),
          child: Column(
            children: [
              const Icon(Icons.star, color: Colors.amber),
              Text(movie.vote!.toStringAsFixed(2)),
            ],
          ),
        ),
      ],
    );
  }
}
