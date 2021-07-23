import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movies_bloc/src/blocs/movies_bloc.dart';
import 'package:movies_bloc/src/models/movie.dart';
import 'package:movies_bloc/src/utils/movie_test_constants.dart';
import 'package:movies_bloc/src/widgets/movie_search_bar.dart';
import '../build_widget.dart';
import '../ui/home_page_test.mocks.dart';

void main() {
  late MockMovieRepository repository;
  late MoviesBloc bloc;
  late Movie movie;

  setUp(
    () {
      repository = MockMovieRepository();
      bloc = MoviesBloc(
        repository,
      );
      movie = Movie(
        page: MovieTestConstants.defaultIntValue,
        results: MovieTestConstants.defaultResultMovieArrayValue,
        totalPages: MovieTestConstants.defaultIntValue,
        totalResults: MovieTestConstants.defaultIntValue,
      );

      when(
        repository.fetchAllMovies(),
      ).thenAnswer(
        (_) async => movie,
      );
    },
  );

  testWidgets(
    MovieTestConstants.movieSearchBarTestWidgetDescription,
    (WidgetTester tester) async {
      await tester.pumpWidget(
        buildWidget(
          Scaffold(
            body: MovieSearchBar(
              moviesBloc: bloc,
            ),
          ),
        ),
      );

      await tester.pump();

      expect(
        find.byType(
          TextField,
        ),
        findsOneWidget,
      );
    },
  );
}
