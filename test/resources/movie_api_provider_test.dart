import 'package:flutter_test/flutter_test.dart';
import 'package:movies_bloc/src/models/movie.dart';
import 'package:movies_bloc/src/resources/movie_api_provider.dart';
import 'package:movies_bloc/src/utils/movie_test_constants.dart';

void main() {
  late MovieApiProvider movieApiProvider;
  setUp(
    () {
      movieApiProvider = MovieApiProvider();
    },
  );
  group(
    MovieTestConstants.movieApiProviderGroupDescription,
    () {
      test(
        MovieTestConstants.movieApiProviderGetMovies,
        () async {
          Movie movie = await movieApiProvider.fetchAllMovies();
          expect(
            movie.results,
            isNotEmpty,
          );
        },
      );
      test(
        MovieTestConstants.movieApiProviderGetFilter,
        () async {
          Movie movie = await movieApiProvider.fetchMoviesByFilter(
            MovieTestConstants.movieApiProviderDefaultSearch,
          );
          expect(
            movie.results,
            isNotEmpty,
          );
        },
      );
    },
  );
}
