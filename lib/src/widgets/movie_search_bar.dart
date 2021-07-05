import 'package:flutter/material.dart';
import '../blocs/i_movies_bloc.dart';
import '../utils/movie_strings.dart';

class MovieSearchBar extends StatefulWidget {
  final IMoviesBloc moviesBloc;

  const MovieSearchBar({
    Key? key,
    required this.moviesBloc,
  }) : super(key: key);

  @override
  _MovieSearchBarState createState() => _MovieSearchBarState();
}

class _MovieSearchBarState extends State<MovieSearchBar> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        icon: Icon(
          Icons.search,
          color: Colors.white,
        ),
        hintText: MovieStrings.hintText,
        hintStyle: TextStyle(
          color: Colors.white,
        ),
      ),
      onSubmitted: (
        query,
      ) {
        widget.moviesBloc.fetchMoviesByFilter(
          query,
        );
      },
    );
  }
}
