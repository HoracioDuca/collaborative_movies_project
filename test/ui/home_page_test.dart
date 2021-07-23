import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movies_bloc/src/blocs/movies_bloc.dart';
import 'package:movies_bloc/src/models/movie.dart';
import 'package:movies_bloc/src/resources/movie_repository.dart';
import 'package:movies_bloc/src/ui/home_page.dart';
import 'package:movies_bloc/src/utils/movie_test_constants.dart';
import 'package:movies_bloc/src/widgets/movie_grid_view.dart';
import 'package:network_image_mock/network_image_mock.dart';
import '../build_widget.dart';
import 'home_page_test.mocks.dart';

@GenerateMocks(
  [
    MovieRepository,
  ],
)
void main() {
  late MoviesBloc bloc;
  late Movie movie;
  late MockMovieRepository repository;

  setUp(
    () {
      movie = Movie(
        page: MovieTestConstants.defaultIntValue,
        results: MovieTestConstants.defaultResultMovieArrayValue,
        totalResults: MovieTestConstants.defaultIntValue,
        totalPages: MovieTestConstants.defaultIntValue,
      );

      repository = MockMovieRepository();
      bloc = MoviesBloc(repository);

      when(
        repository.fetchAllMovies(),
      ).thenAnswer(
        (_) async => movie,
      );
    },
  );

  testWidgets(
    MovieTestConstants.homePageTestWidgetsDescription,
    (WidgetTester tester) async {
      await mockNetworkImagesFor(
        () async {
          await tester.pumpWidget(
            buildWidget(
              HomePage(
                moviesBloc: bloc,
                title: MovieTestConstants.homePageTestTitle,
              ),
            ),
          );
        },
      );
      await tester.pump();
      expect(
        find.byType(MovieGridView),
        findsOneWidget,
      );
    },
  );
}
