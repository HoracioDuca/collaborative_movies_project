import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:movies_bloc/src/utils/movie_strings.dart';
import '../utils/movie_colors.dart';
import '../utils/movie_dimensions.dart';
import '../models/result_movie.dart';

class MovieDetail extends StatelessWidget {
  final ResultMovie result;

  MovieDetail({
    required this.result,
  });

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
              Container(
                height: MovieDimensions.posterHeight,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      result.posterPath.toString(),
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        MovieColors.primaryColor,
                        MovieColors.primaryColor.withOpacity(
                          MovieDimensions.primaryColorMainOpacity,
                        ),
                        MovieColors.primaryColor.withOpacity(
                          MovieDimensions.secondaryColorMainOpacity,
                        ),
                        Colors.transparent,
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: MovieDimensions.edgeInsetsLeftPadding,
                      bottom: MovieDimensions.edgeInsetsBottomPadding,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          result.title,
                          style: TextStyle(
                            color: MovieColors.customWhite,
                            fontSize: MovieDimensions.titleFontSize,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: MovieDimensions.sizedBoxHeight,
                        ),
                        Text(
                          "${result.releaseDate}, ${result.originalLanguage.toUpperCase()}, ${result.voteCount} votes",
                          style: TextStyle(
                            color: MovieColors.customWhite.withOpacity(
                              MovieDimensions.textStyleOpacity,
                            ),
                            fontSize: MovieDimensions.subtitleFontSize,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: MovieDimensions.sizedBoxHeight,
                        ),
                        Row(
                          children: [
                            Text(
                              result.voteAverage.toString(),
                              style: TextStyle(
                                color: Colors.yellow,
                                fontSize: MovieDimensions.subtitleFontSize,
                              ),
                            ),
                            SizedBox(
                              width: MovieDimensions.sizedBoxWidth,
                            ),
                            ...List.generate(
                              MovieDimensions.starsAmount,
                              (
                                index,
                              ) =>
                                  Icon(
                                Icons.star,
                                color:
                                    (index < (result.voteAverage / 2).floor())
                                        ? Colors.yellow
                                        : Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MovieDimensions.sizedBoxHeight,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: MovieDimensions.edgeInsetsLeftPadding,
                ),
                child: Text(
                  MovieStrings.overview,
                  style: TextStyle(
                    color: MovieColors.customWhite.withOpacity(
                      MovieDimensions.overviewTextOpacity,
                    ),
                    fontSize: MovieDimensions.overviewTextFontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: MovieDimensions.edgeInsetsLeftPadding,
                    top: MovieDimensions.edgeInsetsTopPadding),
                child: Text(
                  result.overview,
                  style: TextStyle(
                    color: MovieColors.customWhite
                        .withOpacity(MovieDimensions.textStyleOpacity),
                    fontSize: MovieDimensions.subtitleFontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
