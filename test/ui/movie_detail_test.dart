import 'package:flutter_test/flutter_test.dart';
import 'package:movies_bloc/src/models/result_movie.dart';
import 'package:movies_bloc/src/ui/movie_detail.dart';
import 'package:movies_bloc/src/utils/movie_strings.dart';
import 'package:movies_bloc/src/utils/movie_test_constants.dart';
import 'package:movies_widgets/movies_widgets.dart';
import 'package:network_image_mock/network_image_mock.dart';
import '../build_widget.dart';

void main() {
  late ResultMovie testResult;

  setUp(
    () {
      testResult = ResultMovie(
        voteCount: MovieTestConstants.defaultIntValue,
        id: MovieTestConstants.defaultIntValue,
        voteAverage: MovieTestConstants.defaultDoubleValue,
        title: MovieTestConstants.defaultStringText,
        popularity: MovieTestConstants.defaultDoubleValue,
        posterPath: MovieTestConstants.defaultStringText,
        originalLanguage: MovieStrings.languageNotAssigned,
        originalTitle: MovieStrings.noTitle,
        genreIDs: MovieTestConstants.defaultIntArrayValue,
        adult: false,
        overview: MovieStrings.notOverviewFound,
        releaseDate: MovieStrings.releaseDateNotFound,
      );
    },
  );

  testWidgets(
    MovieTestConstants.movieDetailTestWidgetsDescription,
    (WidgetTester tester) async {
      mockNetworkImagesFor(
        () async {
          await tester.pumpWidget(
            buildWidget(
              MovieDetail(
                posterPath: testResult.posterPath,
                title: testResult.title,
                releaseDate: testResult.releaseDate,
                overview: testResult.overview,
                originalLanguage: testResult.originalLanguage,
                voteCount: testResult.voteCount.toString(),
                voteAverage: testResult.voteAverage,
              ),
            ),
          );
          await tester.pumpAndSettle();
          expect(
            find.byType(
              MovieDetailPoster,
            ),
            findsOneWidget,
          );
          expect(
            find.byType(
              MovieDetailTitle,
            ),
            findsOneWidget,
          );
          expect(
            find.byType(
              MovieDetailSubtitle,
            ),
            findsOneWidget,
          );
          expect(
            find.byType(
              MovieVoteAverage,
            ),
            findsOneWidget,
          );
          expect(
            find.byType(
              MovieDetailOverview,
            ),
            findsOneWidget,
          );
        },
      );
    },
  );
}
