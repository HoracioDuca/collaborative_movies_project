import '../models/movie.dart';

abstract class IMovieRepository {
  Future<Movie> fetchAllMovies();
}
