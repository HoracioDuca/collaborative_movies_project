import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../utils/movie_dimensions.dart';

class MovieVoteAverage extends StatelessWidget {
  final int starCount;
  final double voteAverage;

  const MovieVoteAverage({
    Key? key,
    this.starCount = MovieDimensions.starsAmount,
    required this.voteAverage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          voteAverage.toString(),
          style: TextStyle(
            color: Colors.yellow,
            fontSize: MovieDimensions.titleFontSize,
          ),
        ),
        SizedBox(
          width: MovieDimensions.sizedBoxWidth,
        ),
        SizedBox(
          height: MovieDimensions.sizedBoxStarsList,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: starCount,
            itemBuilder: (
              context,
              index,
            ) {
              return Icon(
                Icons.star,
                color: (index < (voteAverage / 2).floor())
                    ? Colors.yellow
                    : Colors.white,
              );
            },
          ),
        ),
      ],
    );
  }
}
