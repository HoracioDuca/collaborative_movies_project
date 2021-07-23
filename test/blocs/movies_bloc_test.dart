import 'package:movies_bloc/src/blocs/movies_bloc.dart';
import 'package:movies_bloc/src/models/movie.dart';
import 'package:movies_bloc/src/utils/movie_test_constants.dart';
import 'package:test/test.dart';

void main() {
  late MoviesBloc _moviesBloc;

  setUp(() {
    _moviesBloc = MoviesBloc();
  });

  group(
    MovieTestConstants.moviesBlocGroupDescription,
    () {
      test(
        MovieTestConstants.moviesBlocTestDescription,
        () async {
          _moviesBloc.fetchAllMovies();
          _moviesBloc.streamMovies.listen(
            expectAsync1(
              (
                value,
              ) {
                expect(
                  value,
                  isA<Movie>(),
                );
              },
            ),
          );
        },
      );
    },
  );
}
