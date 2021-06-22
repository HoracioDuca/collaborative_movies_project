import 'dart:async';
import '../resources/movie_repository.dart';
import '../models/movie.dart';
import 'i_movies_bloc.dart';

class MoviesBloc extends IMoviesBloc {
  StreamController<Movie> _streamMoviesController =
      StreamController<Movie>.broadcast();
  MovieRepository _movieRepository = MovieRepository();

  @override
  void dispose() {
    _streamMoviesController.close();
  }

  @override
  Future<void> initialize() async {}

  @override
  void fetchMoviesApi() async {
    final _allMovies = await _movieRepository.fetchAllMovies();
    _streamMoviesController.sink.add(_allMovies);
  }

  @override
  Stream<Movie> get streamMovies => _streamMoviesController.stream;
}
