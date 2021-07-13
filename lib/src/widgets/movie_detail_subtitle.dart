import 'package:flutter/material.dart';
import '../utils/movie_colors.dart';
import '../utils/movie_dimensions.dart';

class MovieDetailSubtitle extends StatelessWidget {
  final String movieReleaseDate;
  final String movieOriginalLanguage;
  final int movieVoteCount;

  const MovieDetailSubtitle({
    Key? key,
    required this.movieReleaseDate,
    required this.movieOriginalLanguage,
    required this.movieVoteCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "${this.movieReleaseDate}, ${this.movieOriginalLanguage}, ${this.movieVoteCount} votes",
      style: TextStyle(
        color: MovieColors.customWhite.withOpacity(
          MovieDimensions.textStyleOpacity,
        ),
        fontSize: MovieDimensions.subtitleFontSize,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
