import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import '../widgets/movie_detail_poster.dart';
import '../widgets/movie_detail_subtitle.dart';
import '../widgets/movie_detail_title.dart';
import '../widgets/movie_detail_overview.dart';
import '../widgets/movie_vote_average.dart';
import '../utils/movie_dimensions.dart';
import '../models/result_movie.dart';

class MovieDetail extends StatelessWidget {
  final ResultMovie result;

  const MovieDetail({
    Key? key,
    required this.result,
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
                moviePosterPath: result.posterPath,
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
                      movieTitle: result.title,
                    ),
                    SizedBox(
                      height: MovieDimensions.sizedBoxHeight,
                    ),
                    MovieDetailSubtitle(
                      movieReleaseDate: result.releaseDate,
                      movieOriginalLanguage:
                          result.originalLanguage.toUpperCase(),
                      movieVoteCount: result.voteCount,
                    ),
                    MovieVoteAverage(
                      voteAverage: result.voteAverage,
                    ),
                    MovieDetailOverview(
                      movieOverview: result.overview,
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
