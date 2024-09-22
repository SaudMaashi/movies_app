import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/constants/constants.dart';
import 'package:movies_app/services/movies_service.dart';
import 'package:movies_app/widgets/all_trending_movies_builder.dart';
import 'package:movies_app/widgets/custom_loading_indicator.dart';

class AllMovies extends StatefulWidget {
  const AllMovies({super.key});

  @override
  State<AllMovies> createState() => _AllMoviesState();
}

class _AllMoviesState extends State<AllMovies> {
  var searchText = "A";
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            const SizedBox(height: 35),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 24),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Card(
                      color: const Color(0xFFE1DBE4),
                      child: TextField(
                        style: const TextStyle(
                          color: Color(0xFF151218),
                        ),
                        decoration: const InputDecoration(
                          suffixIcon: Icon(
                            Icons.search,
                            color: Color(0xFF151218),
                          ),
                          contentPadding: EdgeInsets.all(12),
                          hintText: "Enter a movie name...",
                          hintStyle: TextStyle(
                            color: Color(0xFF151218),
                          ),
                          border: InputBorder.none,
                        ),
                        onChanged: (value) {
                          if (value == "") {
                            setState(() {
                              value = "A";
                            });
                          }
                          setState(() {
                            searchText = value;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
            AllTrendingMoviesBuilder(searchText: searchText),
          ],
        ),
      ),
    );
  }
}
