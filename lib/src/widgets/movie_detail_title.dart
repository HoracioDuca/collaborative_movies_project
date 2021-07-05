import 'package:flutter/material.dart';
import '../utils/movie_dimensions.dart';
import '../utils/movie_colors.dart';

class MovieDetailTitle extends StatelessWidget {
  final String movieTitle;

  const MovieDetailTitle({
    Key? key,
    required this.movieTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      movieTitle,
      style: TextStyle(
        color: MovieColors.customWhite,
        fontSize: MovieDimensions.titleFontSize,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
