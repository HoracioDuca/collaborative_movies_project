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
    var allMovies = parsedJson['results'] as List;

    List<ResultMovie> movieTemp =
        allMovies.map((eachMovie) => ResultMovie.fromJson(eachMovie)).toList();

    return Movie(
      page: parsedJson['page'],
      totalResults: parsedJson['total_results'],
      totalPages: parsedJson['total_pages'],
      results: movieTemp,
    );
  }
}
