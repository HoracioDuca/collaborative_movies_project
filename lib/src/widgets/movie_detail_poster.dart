import 'package:flutter/material.dart';
import '../utils/movie_colors.dart';
import '../utils/movie_dimensions.dart';

class MovieDetailPoster extends StatelessWidget {
  final String moviePosterPath;

  const MovieDetailPoster({
    Key? key,
    required this.moviePosterPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColorFiltered(
      colorFilter: ColorFilter.mode(
        MovieColors.primaryColor.withOpacity(
          MovieDimensions.primaryColorMainOpacity,
        ),
        BlendMode.exclusion,
      ),
      child: Container(
        height: MovieDimensions.posterHeight,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              moviePosterPath,
            ),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
