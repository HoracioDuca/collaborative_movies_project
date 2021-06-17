import 'dart:async';
import 'movie_api_provider.dart';
import '../models/movie_model.dart';

class MovieRepository {
  final moviesApiProvider = MovieApiProvider();

  Future<MovieModel> fetchAllMovies() => moviesApiProvider.fetchAllMovies();
}
