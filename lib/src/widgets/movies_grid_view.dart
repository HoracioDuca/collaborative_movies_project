import 'package:flutter/material.dart';
import '../models/movie.dart';
import 'movie_grid_builder.dart';

class MovieGridView extends StatefulWidget {
  final Stream<Movie> allMovies;

  const MovieGridView({
    Key? key,
    required this.allMovies,
  }) : super(key: key);

  @override
  _MovieGridViewState createState() => _MovieGridViewState();
}

class _MovieGridViewState extends State<MovieGridView> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: widget.allMovies,
      builder: (
        context,
        AsyncSnapshot<Movie> snapshot,
      ) {
        return snapshot.hasData
            ? trendingMoviesGrid(
                snapshot,
              )
            : Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.red,
                  color: Colors.black,
                ),
              );
      },
    );
  }
}
