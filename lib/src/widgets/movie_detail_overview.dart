import 'package:flutter/material.dart';
import '../utils/movie_colors.dart';
import '../utils/movie_strings.dart';
import '../utils/movie_dimensions.dart';

class MovieDetailOverview extends StatelessWidget {
  final String movieOverview;

  const MovieDetailOverview({
    Key? key,
    required this.movieOverview,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          MovieStrings.overview,
          style: TextStyle(
            color: MovieColors.customWhite.withOpacity(
              MovieDimensions.overviewTextOpacity,
            ),
            fontSize: MovieDimensions.overviewTextFontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: MovieDimensions.overviewSizedBoxHeight,
        ),
        Text(
          movieOverview,
          style: TextStyle(
            color: MovieColors.customWhite.withOpacity(
              MovieDimensions.textStyleOpacity,
            ),
            fontSize: MovieDimensions.subtitleFontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
