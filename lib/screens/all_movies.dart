import 'package:flutter/material.dart';
import 'package:movies_app/services/movies_service.dart';
import 'package:movies_app/widgets/all_trending_movies_builder.dart';
import 'package:movies_app/widgets/custom_back_button.dart';

class AllTrendingMovies extends StatefulWidget {
  const AllTrendingMovies({super.key});

  @override
  State<AllTrendingMovies> createState() => _AllTrendingMoviesState();
}

class _AllTrendingMoviesState extends State<AllTrendingMovies> {
  var searchText = "A";
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 24, bottom: 24, right: 24, left: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CustomBackButton(),
                  SizedBox(
                    width: 295,
                    child: buildSearchBar(),
                  ),
                ],
              ),
            ),
            AllMoviesBuilder(
                searchText: searchText,
                stream: MoviesService().searchAllMovies(searchText)),
          ],
        ),
      ),
    );
  }

  Card buildSearchBar() {
    return Card(
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
    );
  }
}
