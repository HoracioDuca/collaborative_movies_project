import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:movies_widgets/movies_widgets.dart';
import '../utils/movie_dimensions.dart';

class MovieDetail extends StatelessWidget {
  final String posterPath;
  final String title;
  final String releaseDate;
  final String overview;
  final String originalLanguage;
  final int voteCount;
  final double voteAverage;

  const MovieDetail({
    Key? key,
    required this.posterPath,
    required this.title,
    required this.releaseDate,
    required this.overview,
    required this.originalLanguage,
    required this.voteCount,
    required this.voteAverage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ZoomIn(
          duration: Duration(
            seconds: MovieDimensions.posterZoomInDuration,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MovieDetailPoster(
                moviePosterPath: posterPath,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: MovieDimensions.edgeInsetsTopPadding,
                  left: MovieDimensions.edgeInsetsLeftPadding,
                  bottom: MovieDimensions.edgeInsetsBottomPadding,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MovieDetailTitle(
                      movieTitle: title,
                    ),
                    SizedBox(
                      height: MovieDimensions.sizedBoxHeight,
                    ),
                    MovieDetailSubtitle(
                      movieReleaseDate: releaseDate,
                      movieOriginalLanguage: originalLanguage.toUpperCase(),
                      movieVoteCount: voteCount.toString(),
                    ),
                    MovieVoteAverage(
                      voteAverage: voteAverage,
                    ),
                    MovieDetailOverview(
                      movieOverview: overview,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
