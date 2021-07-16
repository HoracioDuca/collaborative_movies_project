import '../utils/movie_strings.dart';
import 'result_movie.dart';

class Movie {
  late final int page;
  late final int totalResults;
  late final int totalPages;
  late final List<ResultMovie> results;

  Movie({
    required this.page,
    required this.results,
    required this.totalResults,
    required this.totalPages,
  });

  factory Movie.fromJson(
    Map<String, dynamic> parsedJson,
  ) {
    List<ResultMovie> temporalMovieList;
    try {
      var allMovies = parsedJson['results'] as List;
      temporalMovieList = allMovies
          .map((eachMovie) => ResultMovie.fromJson(eachMovie))
          .toList();
    } catch (Exception) {
      throw (MovieStrings.movieListException);
    }
    return Movie(
      page: parsedJson['page'],
      totalResults: parsedJson['total_results'],
      totalPages: parsedJson['total_pages'],
      results: temporalMovieList,
    );
  }
}
