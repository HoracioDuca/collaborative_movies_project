import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import '../ui/movie_detail.dart';
import '../utils/movie_dimensions.dart';

GridView trendingMoviesGrid(AsyncSnapshot snapshot) {
  return GridView.builder(
    itemCount: snapshot.data.results.length,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      mainAxisExtent: MovieDimensions.mainAxisExtent,
      crossAxisCount: MovieDimensions.gridColumns,
    ),
    itemBuilder: (
      BuildContext context,
      int index,
    ) {
      return GridTile(
        child: Container(
          margin: EdgeInsets.all(
            MovieDimensions.gridTileMargin,
          ),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(
                  MovieDimensions.boxShadowOpacity,
                ),
                spreadRadius: MovieDimensions.boxShadowSpreadRadius,
                blurRadius: MovieDimensions.boxShadowBlurRadius,
              ),
            ],
          ),
          child: FadeIn(
            duration: Duration(
              seconds: MovieDimensions.fadeInPosterDuration,
            ),
            child: InkResponse(
              enableFeedback: true,
              child: Image.network(
                snapshot.data.results[index].posterPath,
                fit: BoxFit.cover,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (
                      context,
                    ) =>
                        MovieDetail(
                      posterPath: snapshot.data.results[index].posterPath,
                      title: snapshot.data.results[index].title,
                      releaseDate: snapshot.data.results[index].releaseDate,
                      overview: snapshot.data.results[index].overview,
                      originalLanguage:
                          snapshot.data.results[index].originalLanguage,
                      voteCount: snapshot.data.results[index].voteCount,
                      voteAverage: snapshot.data.results[index].voteAverage,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      );
    },
  );
}
